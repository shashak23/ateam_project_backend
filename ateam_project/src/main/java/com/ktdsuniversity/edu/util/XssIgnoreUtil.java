package com.ktdsuniversity.edu.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class XssIgnoreUtil {

	private static final List<Class<?>> PRIMITIVE_TYPES;
	private static final List<Class<?>> COLLECTION_TYPES;

	static {
		PRIMITIVE_TYPES = new ArrayList<>();
		PRIMITIVE_TYPES.add(String.class);
		PRIMITIVE_TYPES.add(char.class);
		PRIMITIVE_TYPES.add(byte.class);
		PRIMITIVE_TYPES.add(short.class);
		PRIMITIVE_TYPES.add(int.class);
		PRIMITIVE_TYPES.add(long.class);
		PRIMITIVE_TYPES.add(float.class);
		PRIMITIVE_TYPES.add(double.class);
		PRIMITIVE_TYPES.add(boolean.class);
		PRIMITIVE_TYPES.add(Character.class);
		PRIMITIVE_TYPES.add(Byte.class);
		PRIMITIVE_TYPES.add(Short.class);
		PRIMITIVE_TYPES.add(Integer.class);
		PRIMITIVE_TYPES.add(Long.class);
		PRIMITIVE_TYPES.add(Float.class);
		PRIMITIVE_TYPES.add(Double.class);
		PRIMITIVE_TYPES.add(Boolean.class);

		COLLECTION_TYPES = new ArrayList<>();
		COLLECTION_TYPES.add(List.class);
	}

	public static void ignore(Object object) {
		if (object.getClass() == Class.class) {
			return;
		}
		
		Class<?> superClass = object.getClass();
		while (superClass != Object.class) {
			explorerFields(object, superClass);
			superClass = superClass.getSuperclass();
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private static void explorerFields(Object object, Class<?> clazz) {
		Field[] instanceFileds = clazz.getDeclaredFields();

		for (Field field : instanceFileds) {

			if (field.isAnnotationPresent(XssIgnore.class)) {

				Class fieldType = field.getType();
				if (!PRIMITIVE_TYPES.contains(fieldType) && !COLLECTION_TYPES.contains(fieldType)) {
					ignore(getValue(object, field, fieldType));
					continue;
				}

				if (COLLECTION_TYPES.contains(fieldType)) {
					List value = getValue(object, field, List.class);
					if (value != null) {
						Class<?> genericType = getGenericInCollection(value);
						for (int i = 0; i < value.size(); i++) {
							if (!PRIMITIVE_TYPES.contains(genericType)) {
								ignore(value.get(i));
							} else if (genericType == String.class) {
								value.set(i, ignoreText((String) value.get(i)));
							}
						}
					}
				} else {
					ignore(object, field);
				}
			}
		}
	}

	@SuppressWarnings("unchecked")
	private static <T> T getValue(Object object, Field field, Class<T> type) {
		field.setAccessible(true);
		T value = null;
		try {
			value = (T) field.get(object);
		} catch (IllegalArgumentException | IllegalAccessException e) {
		}

		if (value == null) {
			return null;
		}

		return value;
	}

	@SuppressWarnings("unchecked")
	private static <E> Class<E> getGenericInCollection(List<E> list) {
		if (list == null || list.size() == 0) {
			return null;
		}
		
		return (Class<E>) list.get(0).getClass();
	}

	private static void ignore(Object object, Field field) {
		String value = getValue(object, field, String.class);

		try {
			field.set(object, ignoreText(value));
		} catch (IllegalArgumentException | IllegalAccessException e) {
		}
	}

	public static String ignoreText(String dirtyStr) {
		if (dirtyStr != null) {
			dirtyStr = dirtyStr.replace("&lt;", "<")
							   .replace("&gt;", ">")
							   .replace("&quot;", "\"")
							   .replace("&quot;", "\"")
							   .replace("&nbsp", " ")
							   .replace("&amp;", "&");
		}
		return dirtyStr;
	}

}
