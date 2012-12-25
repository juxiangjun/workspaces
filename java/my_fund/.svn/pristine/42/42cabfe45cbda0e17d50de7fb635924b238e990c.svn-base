package com.zj198.util;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.zj198.model.DicCommon;

public class Test {
	public static void main(String[] args){
		Test t = new Test();
//		t.testJsonArray();
//		t.testObjectToJson();
//		t.testMapToJson();
		long l = 2199023255552111111l;
		System.out.println(l*2);
	}
	
	public void testJson(){
		String str = "{name:[{ss:tiger,dd:22},{ss:tiger1,dd:11}],age:19}";
		String str1 = "{'dd':{\"year\":\"2011\",\"data\":{\"01\":\"0\",\"02\":\"0\",\"03\":\"0\"}},'dd':{\"year1\":\"2011\",\"data\":{\"01\":\"0\",\"02\":\"0\",\"03\":\"0\"}}}";
		
		JsonParser p = new JsonParser();//解析器
		JsonElement je = p.parse(str);
		JsonObject j = je.getAsJsonObject();
		System.out.println(j.toString());
		System.out.println(j.get("name"));
		JsonArray ja = j.getAsJsonArray("name");
		System.out.println(ja.get(0).getAsJsonObject().get("ss").getAsString());
		//System.out.println(j.get("data").getAsJsonObject().get("01"));
	}
	public void testJsonArray(){
		String str2 = "[{ss:tiger,dd:22},{ss:tiger1,dd:11}]";
		JsonParser p = new JsonParser();//解析器
		JsonElement je = p.parse(str2);
		JsonArray ja = je.getAsJsonArray();
		System.out.println(ja.get(0).getAsJsonObject().get("ss").getAsString());
	}
	public void testObjectToJson(){
		Gson g = new Gson();
		DicCommon d = new DicCommon();
		d.setId(100);
		d.setName("tiger");
		d.setGroup(10);
		String str = g.toJson(d);
		System.out.println(str);
		JsonParser p = new JsonParser();//解析器
		JsonElement je = p.parse(str);
		DicCommon d1 = g.fromJson(je, DicCommon.class);
		System.out.println(d1.getName());
	}
	public void testMapToJson(){
		Gson g = new Gson();
		Map m = new HashMap();
		m.put("name", "tiger");
		m.put("age", "19");
		String str = g.toJson(m);
		System.out.println(str);
	}
}
