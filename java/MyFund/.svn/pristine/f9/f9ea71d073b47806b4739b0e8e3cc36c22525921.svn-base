package com.zj198.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import com.zj198.model.DicBaseRate;

/**
 * 动态生成基本利率js文件
 * @author zeroleavebaoyang@gmail.com
 * @since 2012-12-11|上午11:12:09
 */
public class JsUtil {

	/**
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-12-11|上午11:11:23
	 * @param path 路径
	 * @param fileName 名称
	 * @param content 需要写入的内容
	 */
	public static void writeFile(String path, String fileName, String content) {
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		FileWriter fw = null;
		try {
			fw = new FileWriter(path + "/" + fileName);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content);
			bw.flush();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String myContent(List<DicBaseRate> list){
		StringBuffer s = new StringBuffer();
		StringBuffer t = new StringBuffer();
		for(DicBaseRate r : list){
			s.append(r.getRate()).append(",");
			t.append("'" + r.getMemo() + "'").append(",");
		}
		s.delete((s.length()-1), s.length());
		t.delete((t.length()-1), t.length());
		StringBuffer sb = new StringBuffer();
		sb.append("var baserate_inteArr = new Array").append("(").append(s.toString()).append(");").append("\n");
		sb.append("var baserate_inteTextArr = new Array").append("(").append(t.toString()).append(");");
		return sb.toString();
	}

}
