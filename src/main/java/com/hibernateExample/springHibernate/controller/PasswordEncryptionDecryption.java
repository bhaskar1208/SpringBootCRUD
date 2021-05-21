package com.hibernateExample.springHibernate.controller;

import java.util.Base64;

import org.springframework.stereotype.Component;

@Component
public class PasswordEncryptionDecryption {
/**********************************************************************************************************/
	
	//To encrypt password string
	public String getEncodedString(String str) {
		return Base64.getEncoder().encodeToString(str.getBytes());
	}
	
	/**********************************************************************************************************/
	
	//To decrypt the encrypted password string
	public String getDecodedString(String encoded) {
		return new String(Base64.getDecoder().decode(encoded));
	}
}
