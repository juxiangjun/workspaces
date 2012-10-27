package com.zj198.util;

import java.util.Random;

public class StringUtil {

	//生成6位随机字符数字的激活验证码
	public static String createActiveCode(){
		char c[] = {'a','b','c','d','e','f','g','h','i','j','k','m','n','p','q','r','s','t','u','v','w','x','y','3','4','5','6','7','8','9'};
		StringBuilder sRand = new StringBuilder();
		for (int i = 0; i < 6; i++){
			Random random = new Random();
			int index = random.nextInt(30);
			String rand = String.valueOf(c[index]);
			sRand.append(rand);
		}
		return sRand.toString();
	}
	
	public static String getStrByArray(String[] arr){
		StringBuffer result = new StringBuffer();
		if(arr != null && arr.length > 0){
			result.append(",");
			for(String str:arr){
				result.append(str).append(",");
			}
		}
		return result.toString();
	}
	

	
}
