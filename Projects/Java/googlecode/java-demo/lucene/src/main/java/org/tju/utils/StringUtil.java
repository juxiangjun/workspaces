package org.tju.utils;
import java.util.*;


public class StringUtil {

	public StringUtil() {

	}


	public static String getRandomString(int n) {
		String result = "";
		Random r = new Random();
		int i = 0;
		int c;
		while (i < n) {
			c = r.nextInt(122);
			if ((c >= 48 && c <= 57) || (c >= 65 && c <= 90)
					|| (c >= 97 && c <= 122)) {
				result = result + (char) c;
				i++;
			}
		}
		return result;
	}

	public static boolean isNull(String str) {
		boolean isNull = false;
		if (null == str || str.equalsIgnoreCase("null")
				|| str.trim().equalsIgnoreCase("")
				|| str.trim().equalsIgnoreCase("undefined")) {
			isNull = true;
		}
		return isNull;
	}

	public static String getFirstAlphabetLowcase(String str) {
		String result = "";
		String firstAlphabet = str.substring(0, 1);
		String remainString = str.substring(1, str.length());
		firstAlphabet = firstAlphabet.toLowerCase();
		result = firstAlphabet + remainString;
		return result;
	}

	/**/
	public static String getFirstAlphabetUpper(String str) {
		String result = "";
		/* @firstAlphabet */
		String firstAlphabet = str.substring(0, 1);
		/* @remainString */
		String remainString = str.substring(1, str.length());
		/**/
		firstAlphabet = firstAlphabet.toUpperCase();
		/**/
		result = firstAlphabet + remainString;
		return result;
	}

	public static String getUpdatedStr(String original, String code) {
		if (code.length() > original.length()) {
			return code;
		} else {
			return original.substring(0, original.length() - code.length())
					+ code;
		}
	}

	public static String formatString(String str, int length, String prefix) {
		int diff = length - str.length();
		String temp = "";
		for (int i = 0; i <= diff; i++) {
			temp = temp + prefix;
		}
		return temp + str;
	}

	@SuppressWarnings("unchecked")
	public static String[] getStrList(String str, String seperateLabel) {
		String result[] = null;
		Vector v = getStringList(str, seperateLabel);
		int i = v.size();
		if (i > 0) {
			result = new String[i];
		}
		int m = 0;
		Iterator it = v.iterator();
		while (it.hasNext()) {
			result[m] = (String) it.next();
			m++;
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	private static Vector getStringList(String str, String seperateLabel) {
		Vector v = new Vector();
		int i = 0;
		setStringList(v, i, str, seperateLabel);
		return v;
	}

	@SuppressWarnings("unchecked")
	private static void setStringList(Vector stringList, int i, String str,
			String seperateLabel) {
		int index = str.indexOf(seperateLabel);
		if (index > 0) {
			String subString = str.substring(0, index);
			stringList.add(subString);
			str = str.substring(index + 1, str.length());
			i++;
			setStringList(stringList, i, str, seperateLabel);
		} else {
			stringList.add(str);
		}
	}

	/*
	 * ordinal_positon:ordinalPostion
	 */
	public static String getStrByClazzName(String str) {
		String result = "";
		int length = str.length();
		boolean upperNext = false;
		String temp = "";
		for (int i = 0; i < length; i++) {
			temp = str.substring(i, i + 1);
			if (temp.equals("_")) {
				upperNext = true;
			} else {
				if (upperNext) {
					temp = temp.toUpperCase();
					upperNext = false;
				}
				result = result + temp;
			}
		}
		return result;
	}

}
