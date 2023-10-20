package com.ktdsuniversity.edu.util;

public class StringUtils {

	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}
	
	public static String nvl(String str, String defaultValue) {
		return isEmpty(str) ? defaultValue : str;
	}
	
}
