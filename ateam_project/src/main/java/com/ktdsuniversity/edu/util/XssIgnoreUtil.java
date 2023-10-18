package com.ktdsuniversity.edu.util;

import java.lang.reflect.Field;

public class XssIgnoreUtil {

	public static void ignore(Object object) {
		
		Field[] instanceFileds = object.getClass().getDeclaredFields();
		
		for (Field field : instanceFileds) {
			
			if (field.isAnnotationPresent(XssIgnore.class)) {
				
				field.setAccessible(true);
				String value = null;
				try {
					value = (String) field.get(object);
				} catch (IllegalArgumentException | IllegalAccessException e) {}
				
				value = value.replace("&lt;", "<")
							 .replace("&gt;", ">")
							 .replace("&quot;", "\"")
							 .replace("&quot;", "\"")
							 .replace("&nbsp", " ")
							 .replace("&amp;", "&");
				
				try {
					field.set(object, value);
				} catch (IllegalArgumentException | IllegalAccessException e) {}
			}
			
		}
		
	}
	
	
}
