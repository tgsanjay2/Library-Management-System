package com.Validation;

public class StringValidation {
	public static String capitalize(String str) {
		StringBuilder result = trimSpace(str);
		int i=0, j=0;
		while(j<str.length()) {
			if(i==j) {
				i++;
				j++;
			}
			else if(str.charAt(j) == ' ') {
				result.append(caps(str, i, j));
				i=j;
			}
			j++;
		}
		return result.toString();
	}
	public static String caps(String str, int i, int j) {
		return str.toUpperCase(str.substring(i, i+1)) + str.toLowerCase(str.substring(i+1, j));
	}
	public static StringBuilder trimSpace(String str) {
		StringBuilder ans = new StringBuilder(str);
		int i=0;
		while(i<ans.length()) {
			
		}
	}
}
