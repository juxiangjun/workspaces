package org.tju.ebs.utils;

import java.sql.Timestamp;
import java.util.*;

//Format : YYYY-MM-DD HH_MM_SS 
public class DateUtil {
	private static String DATE_DIVISION = "-"; //
	private static String TIME_DIVISION = ":"; //
	private static String DATE_TIME_DIVISION = " "; //

	private int m_year;
	private int m_month;
	private int m_day;
	private int m_hour;
	private int m_minute;
	private int m_second;

	// format : YYYY-MM-DD HH-MM-SS
	public DateUtil() {
		GregorianCalendar now = new GregorianCalendar();
		m_year = now.get(Calendar.YEAR);
		m_month = now.get(Calendar.MONTH) + 1;
		m_day = now.get(Calendar.DAY_OF_MONTH);
		m_hour = now.get(Calendar.HOUR_OF_DAY);
		m_minute = now.get(Calendar.MINUTE);
		m_second = now.get(Calendar.SECOND);
	}

	@SuppressWarnings("deprecation")
	public Timestamp getNow() {
		return new Timestamp(this.m_year, this.m_month, this.m_day,
				this.m_hour, this.m_minute, this.m_second, 0);
	}

	public DateUtil addMonths(int months) throws Exception {
		this.m_month = this.m_month + months;

		if (m_month > 12) {
			int y = m_month / 12;
			this.m_year = this.m_year + y;
			this.m_month = this.m_month - y * 12;
		}

		if (m_month < 1) {
			int y = m_month / 12;
			y = y - 1;
			this.m_year = this.m_year + y;
			this.m_month = this.m_month + 12;
		}

		if (this.m_day > this.getMonthEnd(m_year, m_month)) {
			this.m_day = this.getMonthEnd(m_year, m_month);
		}

		return new DateUtil(this.m_year, this.m_month, this.m_day, this.m_hour,
				this.m_minute, this.m_second);
	}

	public DateUtil addDays(int days) throws Exception {

		return new DateUtil(this.m_year, this.m_month, this.m_day, this.m_hour,
				this.m_minute, this.m_second);
	}

	// format : YYYY-MM-DD HH-MM-SS
	public DateUtil(int year, int month, int day, int hour, int minute,
			int second) throws Exception {
		if (!isValid(year, month, day, hour, minute, second)) {
			throw new Exception("");
		}
		m_year = year;
		m_month = month;
		m_day = day;
		m_hour = hour;
		m_minute = minute;
		m_second = second;
	}

	// format : YYYY-MM-DD HH-MM-SS
	public DateUtil(DateUtil date) throws Exception {
		if (date == null) {
			throw new Exception("!");
		}
		if (!date.isValid()) {
			throw new Exception("!");
		}
		m_year = date.m_year;
		m_month = date.m_month;
		m_day = date.m_day;
		m_hour = date.m_hour;
		m_minute = date.m_minute;
		m_second = date.m_second;

	}

	// format : YYYY-MM-DD HH-MM-SS

	public DateUtil(String date) throws Exception {
		int[] r = getDateFields(date);
		m_year = r[0];
		m_month = r[1];
		m_day = r[2];
		m_hour = r[3];
		m_minute = r[4];
		m_second = r[5];

		if (!isValid(m_year, m_month, m_day, m_hour, m_minute, m_second)) {
			throw new Exception("");
		}
	}

	public void advanceDays(int days) {
		fromJulian(toJulian() + days);
	}

	public int daysBetween(DateUtil b) {
		return toJulian() - b.toJulian();
	}

	/**
	 * Converts a Julian day to a calendar date
	 * 
	 * This algorithm is from Press et al., Numerical Recipes in C, 2nd ed.,
	 * Cambridge University Press 1992
	 * 
	 * @param j
	 *            the Julian date
	 */

	private void fromJulian(int j) {
		int ja = j;

		int JGREG = 2299161;
		/*
		 * the Julian date of the adoption of the Gregorian calendar
		 */

		if (j >= JGREG)
		/*
		 * cross-over to Gregorian Calendar produces this correction
		 */
		{
			int jalpha = (int) (((float) (j - 1867216) - 0.25) / 36524.25);
			ja += 1 + jalpha - (int) (0.25 * jalpha);
		}
		int jb = ja + 1524;
		int jc = (int) (6680.0 + ((float) (jb - 2439870) - 122.1) / 365.25);
		int jd = (int) (365 * jc + (0.25 * jc));
		int je = (int) ((jb - jd) / 30.6001);
		m_day = jb - jd - (int) (30.6001 * je);
		m_month = je - 1;
		if (m_month > 12)
			m_month -= 12;
		m_year = jc - 4715;
		if (m_month > 2)
			--m_year;
		if (m_year <= 0)
			--m_year;
	}

	public DateUtil getAdvanceDays(int days) throws Exception {
		DateUtil r = new DateUtil(this);
		r.advanceDays(days);
		return r;
	}

	private static int[] getDateFields(String t) throws Exception {
		String[] dayAndtime = getStringsFromStr(t, DATE_TIME_DIVISION);
		if (dayAndtime.length != 2 && dayAndtime.length != 1) {
			throw new Exception(""); // exit,
		}

		// 0 is year,1 is month ,2 is day
		int[] dates = getIntsFromStr(dayAndtime[0], DATE_DIVISION);
		if (dates.length != 3) {
			throw new Exception("");
		}

		int[] times;
		times = new int[3];

		if (dayAndtime.length == 2) {
			// 0 is hour,1 is minute ,2 is second
			int[] ts = getIntsFromStr(dayAndtime[1], TIME_DIVISION);
			if (ts.length > 3) {
				throw new Exception("");
			}

			if (ts.length == 1) {
				times[0] = ts[0];
				times[1] = 0;
				times[2] = 0;
			}
			if (ts.length == 2) {
				times[0] = ts[0];
				times[1] = ts[1];
				times[2] = 0;
			}
			if (ts.length == 3) {
				times[0] = ts[0];
				times[1] = ts[1];
				times[2] = ts[2];
			}
		} else {
			times[0] = 0;
			times[1] = 0;
			times[2] = 0;
		}

		int[] r = new int[6];
		r[0] = dates[0];
		r[1] = dates[1];
		r[2] = dates[2];
		r[3] = times[0];
		r[4] = times[1];
		r[5] = times[2];
		return r;

	}

	public String getDateString() {
		String affMonth = m_month < 10 ? "0" + String.valueOf(m_month) : String
				.valueOf(m_month);
		String affDay = m_day < 10 ? "0" + String.valueOf(m_day) : String
				.valueOf(m_day);

		return String.valueOf(m_year) + DATE_DIVISION + affMonth
				+ DATE_DIVISION + affDay;
	}

	public String getShortDateString() {
		String affMonth = m_month < 10 ? "0" + String.valueOf(m_month) : String
				.valueOf(m_month);
		String affDay = m_day < 10 ? "0" + String.valueOf(m_day) : String
				.valueOf(m_day);
		return String.valueOf(m_year) + affMonth + affDay;
	}

	public String getShortTimeString() {

		String hh = this.m_hour < 10 ? "0" + String.valueOf(m_hour) : String
				.valueOf(m_hour);
		String mi = this.m_minute < 10 ? "0" + String.valueOf(m_minute)
				: String.valueOf(m_minute);
		String ss = this.m_second < 10 ? "0" + String.valueOf(this.m_second)
				: String.valueOf(m_second);
		return hh + mi + ss;
	}

	public int getDay() {
		return m_day;
	}

	public String getFullString() {
		String affMonth = m_month < 10 ? "0" + String.valueOf(m_month) : String
				.valueOf(m_month);
		String affDay = m_day < 10 ? "0" + String.valueOf(m_day) : String
				.valueOf(m_day);
		String affHour = m_hour < 10 ? "0" + String.valueOf(m_hour) : String
				.valueOf(m_hour);
		String affMinute = m_minute < 10 ? "0" + String.valueOf(m_minute)
				: String.valueOf(m_minute);
		String affSecond = m_second < 10 ? "0" + String.valueOf(m_second)
				: String.valueOf(m_second);

		return String.valueOf(m_year) + DATE_DIVISION + affMonth
				+ DATE_DIVISION + affDay + DATE_TIME_DIVISION + affHour
				+ TIME_DIVISION + affMinute + TIME_DIVISION + affSecond;
	}

	public int getHour() {
		return m_hour;
	}

	/*
	 * example: str = "1:2:3:4:" ; token=":" ; return int[4] ,
	 * [0]=1,[1]=2,[2]=3,[3]=4
	 */
	@SuppressWarnings("unchecked")
	private static int[] getIntsFromStr(String str, String token) {
		StringTokenizer st = new StringTokenizer(str, token);
		Vector v = new Vector();
		while (st.hasMoreTokens()) {
			v.add(st.nextToken());
		}
		int[] ints = new int[v.size()];
		for (int i = 0; i < v.size(); i++) {
			ints[i] = Integer.parseInt((String) v.get(i));
		}
		return ints;
	}

	public int getMinute() {
		return m_minute;
	}

	public int getMonth() {
		return m_month;
	}

	public int getMonthEnd(int y, int m) {
		int r = 0;

		if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10
				|| m == 12) {
			r = 30;
		}
		if (m == 4 || m == 6 || m == 9 || m == 11) {
			r = 29;
		}
		if (m == 2) {

			if (0 == y % 4 && (y % 100) != 0 || 0 == y % 400)//
			{
				r = 28;
			} else//
			{
				r = 27;
			}
		}

		return r;
	}

	public DateUtil getMonthEnd() throws Exception {
		DateUtil r = getMonthStart();
		if (r.getMonth() == 1 || r.getMonth() == 3 || r.getMonth() == 5
				|| r.getMonth() == 7 || r.getMonth() == 8 || r.getMonth() == 10
				|| r.getMonth() == 12) {
			r.advanceDays(30);
		}
		if (r.getMonth() == 4 || r.getMonth() == 6 || r.getMonth() == 9
				|| r.getMonth() == 11) {
			r.advanceDays(29);
		}
		if (r.getMonth() == 2) {
			int year = r.getYear();

			if (0 == year % 4 && (year % 100) != 0 || 0 == year % 400)//
			{
				r.advanceDays(28);
			} else//
			{
				r.advanceDays(27);
			}
		}

		return r;
	}

	public DateUtil getMonthStart() throws Exception {
		return new DateUtil(m_year, m_month, 1, 0, 0, 0);
	}

	public int getQuarter() {
		return (m_month + 2) / 3;
	}

	public int getSecond() {
		return m_second;
	}

	public java.sql.Date getSqlDate() {
		return java.sql.Date.valueOf(getDateString());
	}

	@SuppressWarnings("unchecked")
	private static String[] getStringsFromStr(String str, String token) {
		StringTokenizer st = new StringTokenizer(str, token);
		Vector v = new Vector();
		while (st.hasMoreTokens()) {
			v.add(st.nextToken());
		}
		String[] strs = new String[v.size()];
		for (int i = 0; i < v.size(); i++) {
			strs[i] = (String) v.get(i);
		}
		return strs;
	}

	public String getTimeString() {
		String affHour = m_hour < 10 ? "0" + String.valueOf(m_hour) : String
				.valueOf(m_hour);
		String affMinute = m_minute < 10 ? "0" + String.valueOf(m_minute)
				: String.valueOf(m_minute);
		String affSecond = m_second < 10 ? "0" + String.valueOf(m_second)
				: String.valueOf(m_second);

		return affHour + TIME_DIVISION + affMinute + TIME_DIVISION + affSecond;
	}

	public DateUtil getWeekEnd() throws Exception {
		DateUtil r = getWeekStart();
		r.advanceDays(7);
		return r;
	}

	public DateUtil getWeekStart() throws Exception {
		// 2000-1-3
		DateUtil std = new DateUtil("2000-1-3");
		int days = daysBetween(std);
		int m = days % 7;
		DateUtil r;
		if (m >= 0) {
			r = getAdvanceDays(-m);
		} else {
			r = getAdvanceDays(-m - 7);
		}
		return r;
	}

	public int getYear() {
		return m_year;
	}

	public boolean isValid() {
		return isValid(m_year, m_month, m_day, m_hour, m_minute, m_second);
	}

	// valid format : YYYY-MM-DD HH-MM-SS or
	// format : YYYY-MM-DD HH-MM-SS
	public static boolean isValid(int year, int month, int day, int hour,
			int minute, int second) {
		// time check
		if (hour < 0 || hour > 23 || minute < 0 || minute > 59 || second < 0
				|| second > 59) {
			return false;
		}

		// date check
		if (year < 0 || month < 1 || month > 12 || day < 1 || day > 31) {
			return false;
		}
		switch (month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			return true;
		case 4:
		case 6:
		case 9:
		case 11:
			if (day > 30)
				return false;
			return true;
		case 2:
			//
			if (0 == year % 4 && (year % 100) != 0 || 0 == year % 400) {
				if (day > 29)
					return false;
				return true;
			}
			//
			if (day > 28)
				return false;
			return true;
		default:
			return false;
		}
	}

	// YYYY-MM-DD
	public static boolean isValid(String sDate) throws Exception {
		int[] r;
		try {
			r = getDateFields(sDate);
		} catch (Exception e) {
			return false;
		}
		return isValid(r[0], r[1], r[2], r[3], r[4], r[5]);
	}

	/**
	 * @return The Julian day number that begins at noon of this day Positive
	 *         year signifies A.D., negative year B.C. Remember that the year
	 *         after 1 B.C. was 1 A.D.
	 * 
	 *         A convenient reference point is that May 23, 1968 noon is Julian
	 *         day 2440000.
	 * 
	 *         Julian day 0 is a Monday.
	 * 
	 *         This algorithm is from Press et al., Numerical Recipes in C, 2nd
	 *         ed., Cambridge University Press 1992
	 */
	private int toJulian() {
		int jy = m_year;
		if (m_year < 0)
			jy++;
		int jm = m_month;
		if (m_month > 2)
			jm++;
		else {
			jy--;
			jm += 13;
		}
		int jul = (int) (java.lang.Math.floor(365.25 * jy)
				+ java.lang.Math.floor(30.6001 * jm) + m_day + 1720995.0);

		int IGREG = 15 + 31 * (10 + 12 * 1582);
		// Gregorian Calendar adopted Oct. 15, 1582

		if (m_day + 31 * (m_month + 12 * m_year) >= IGREG)
		// change over to Gregorian calendar
		{
			int ja = (int) (0.01 * jy);
			jul += 2 - ja + (int) (0.25 * ja);
		}
		return jul;
	}

	public String toString() {
		return getFullString();
	}

	public int getWeekDay() throws Exception {
		// 2000-1-3
		DateUtil std = new DateUtil("2000-1-3");
		int days = daysBetween(std);
		int m = days % 7;

		if (m >= 0) {
			return m + 1;
		} else {
			return m + 8;
		}
	}

	public static String getCalender(String formName, String fieldName,
			String date) {

		/*
	 * 
	 */
		DateUtil d = null;
		/*
	 * 
	 */
		DateUtil monthDays = null;
		/*
	 * 
	 */
		int month_days = 0;

		/*
	 * 
	 */
		int week_first = 0;

		/*
	 * 
	 */
		// int month = 0;

		/*
	 * 
	 */
		// int year = 0;

		/*
	 * 
	 */

		// int curr_day = 0;
		DateUtil du = new DateUtil();

		try {

			d = new DateUtil(date);
			// curr_day = d.getDay();
			monthDays = d.getMonthEnd();
			month_days = monthDays.getDay();
			// String first_day = d.getYear()+"/"+d.getMonth()+"/01";
			DateUtil du_first_day = new DateUtil(d.getYear(), d.getMonth(), 1,
					d.getHour(), d.getMinute(), d.getSecond());
			week_first = du_first_day.getWeekDay();
		} catch (Exception e) {
			e.printStackTrace();
		}

		int m = 0;
		int i = 1;

		String result = "";
		if (week_first > 1 && week_first < 7) {
			result = result + "<tr><td COLSPAN=" + Integer.toString(week_first)
					+ ">&nbsp</td>";
			for (m = week_first + 1; m <= 7; m++) {
				String normal = "#000000";
				if (m == 7 || m == 0) {
					normal = "##AA6699";
				}
				DateUtil dd = null;
				try {
					dd = new DateUtil(d.getYear(), d.getMonth(), i,
							d.getHour(), d.getMinute(), d.getSecond());
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (du.getDateString().equalsIgnoreCase(dd.getDateString())) {
					if (i < 10) {
						result = result
								+ "<td align=center><b><a href=javascript:p('"
								+ dd.getDateString()
								+ "') class='calInactive'><font color="
								+ normal + "  size=2>0" + Integer.toString(i)
								+ "</font></a></b></td>";
					} else {
						result = result
								+ "<td align=center><b><a href=javascript:p('"
								+ dd.getDateString()
								+ "') class='calInactive'><font color="
								+ normal + "  size=2>" + Integer.toString(i)
								+ "</font></a></b></td>";
					}

				} else {
					if (i < 10) {
						result = result
								+ "<td align=center><a href=javascript:p('"
								+ dd.getDateString()
								+ "') class='calActive'><font color=" + normal
								+ "  size=2>0" + Integer.toString(i)
								+ "</font></a></td>";
					} else {
						result = result
								+ "<td align=center><a href=javascript:p('"
								+ dd.getDateString()
								+ "') class='calActive'><font color=" + normal
								+ "  size=2>" + Integer.toString(i)
								+ "</font></a></td>";
					}
				}
				i++;
			}
			result = result + "</tr>";
		}

		while (i <= month_days) {
			result = result + "<tr>";
			for (m = 0; m < 7; m++) {
				DateUtil dd = null;
				try {
					dd = new DateUtil(d.getYear(), d.getMonth(), i,
							d.getHour(), d.getMinute(), d.getSecond());
				} catch (Exception e) {
					e.printStackTrace();
				}

				String normal = "#000000";
				if (m == 6 || m == 0) {
					normal = "##AA6699";
				}
				if (du.getDateString().equalsIgnoreCase(dd.getDateString())) {
					if (i < 10) {
						result = result
								+ "<td align=center><b><a href=javascript:p('"
								+ dd.getDateString()
								+ "') class='calInactive'><font color="
								+ normal + " size=2>0" + Integer.toString(i)
								+ "</font></a></b></td>";
					} else {
						result = result
								+ "<td align=center><b><a href=javascript:p('"
								+ dd.getDateString()
								+ "') class='calInactive'><font color="
								+ normal + "  size=2>" + Integer.toString(i)
								+ "</font></a></b></td>";
					}

				} else {
					if (i < 10) {
						result = result
								+ "<td align=center><a href=javascript:p('"
								+ dd.getDateString()
								+ "') class='calInactive'><font color="
								+ normal + "  size=2>0" + Integer.toString(i)
								+ "</font></a></td>";
					} else {
						result = result
								+ "<td align=center><a href=javascript:p('"
								+ dd.getDateString()
								+ "') class='calInactive'><font color="
								+ normal + "  size=2>" + Integer.toString(i)
								+ "</font></a></td>";
					}
				}

				i++;
				if (i > month_days) {
					break;
				}

			}
			result = result + "</tr>";
		}
		return result;
	}

}
