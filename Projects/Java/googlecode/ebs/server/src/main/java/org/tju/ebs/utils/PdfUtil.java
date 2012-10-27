package org.tju.ebs.utils;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.PageSize;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

public class PdfUtil {

	public static Document createPdf(String filePath) {
		Document dom = new Document(PageSize.A4, 50, 50, 50, 50);
		try {
			PdfWriter.getInstance(dom, new FileOutputStream(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return dom;
	}

	public static BaseFont getFont() {
		BaseFont bf = null;
		try {
			bf = BaseFont.createFont("c:\\windows\\fonts\\simsun.ttc,1",
					BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bf;
	}

}
