package org.tju.ebs.utils;

import java.io.File;
import java.io.IOException;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ExcelUtil {

	public static WritableSheet createExcel(String path) {
		WritableWorkbook wb = null;
		try {
			wb = Workbook.createWorkbook(new File(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		WritableSheet ws = wb.createSheet("Sheet1", 0);
		return ws;

	}
}
