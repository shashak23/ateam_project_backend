package com.ktdsuniversity.edu.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class MaskUtil {

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
	
	public static void masking(Object object) {
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

			if (field.isAnnotationPresent(Mask.class)) {
				Mask mask = field.getDeclaredAnnotation(Mask.class);
				Class fieldType = field.getType();
				if (!PRIMITIVE_TYPES.contains(fieldType) && !COLLECTION_TYPES.contains(fieldType)) {
					masking(getValue(object, field, fieldType));
					continue;
				}

				if (COLLECTION_TYPES.contains(fieldType)) {
					List value = getValue(object, field, List.class);
					if (value != null) {
						Class<?> genericType = getGenericInCollection(value);
						for (int i = 0; i < value.size(); i++) {
							if (!PRIMITIVE_TYPES.contains(genericType)) {
								masking(value.get(i));
							} else if (genericType == String.class) {
								value.set(i, maskText((String) value.get(i), mask.value()));
							}
						}
					}
				} else {
					masking(object, field, mask);
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
	
	private static void masking(Object object, Field field, Mask mask) {
		String value = getValue(object, field, String.class);

		try {
			field.set(object, maskText(value, mask.value()));
		} catch (IllegalArgumentException | IllegalAccessException e) {
		}
	}
	
	@SuppressWarnings("unchecked")
	private static <E> Class<E> getGenericInCollection(List<E> list) {
		if (list == null || list.size() == 0) {
			return null;
		}
		
		return (Class<E>) list.get(0).getClass();
	}
	
	private static String maskText(String text, MaskType type) {
		if (text != null) {
			if (type == MaskType.NAME) {
				String firstName = text.substring(0, 1);
				String lastName = text.substring(text.length() - 1);
				if (text.length() == 2) {
					lastName = "*";
				}
				text = firstName +  "*".repeat(text.length() - 2) +  lastName;
			}
			else if (type == MaskType.PHONE) {
				if (text.contains("-")) {
					String[] phoneArray = text.split("-");
					text = phoneArray[0] + "****" + phoneArray[2];
				}
				else {
					String phone = text.substring(0, 3);
					phone += "****";
					phone += text.substring("0101234".length());
					text = phone;
				}
			}
			else if (type == MaskType.EMAIL) {
				String id = text.split("@")[0];
				String domain = text.split("@")[1];
				String firstName = id.substring(0, 1);
				String lastName = id.substring(id.length() - 1);
				
				if (id.length() == 2) {
					lastName = "*";
				}
				
				text = firstName +  "*".repeat(id.length() - 2) +  lastName + "@" + domain;
			}
			else if (type == MaskType.ADDRESS) {
				String address = text;
				
				if (text.contains("길 ")) {
					address = text.substring(0, text.lastIndexOf("길 ") + 2);
				}
				else if (text.contains("로")) {
					address = text.substring(0, text.lastIndexOf("로") + 1);
				}
				else if (text.contains("동 ")) {
					address = text.substring(0, text.lastIndexOf("동 ") + 2);
				}
				
				text = address + "*****";
			}
		}
		return text;
	}
	
}
