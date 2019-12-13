package edu.project.olaservice.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class Utility {
	
	
	private static final String ENCRIPTION_SEED = "projectgroup";
	private static StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor(); 
	static{
		encryptor.setPassword(ENCRIPTION_SEED);
	}
	public static Connection getConnection() throws ClassNotFoundException, SQLException { 
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 return DriverManager.getConnection("");
	}
	
	public static String getEncryptText(String text) {
		return encryptor.encrypt(text);
	}
	
	public static String getDecryptText(String text) {
		return encryptor.decrypt(text);
	}
	
	public static void main(String[] args) {
		
		System.out.println(getEncryptText("rid@123"));
		System.out.println(getEncryptText("rid@123"));
		System.out.println(getEncryptText("rid@123"));
	}
	
}
