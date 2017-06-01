package org.khmerslide.entities;

import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.HashSet;
import java.util.Set;

import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.drive.DriveFile;
import org.springframework.social.google.api.impl.GoogleTemplate;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

public class CreateFolder {
	public String createDrive() throws GeneralSecurityException, IOException{
		 String folderId;
		//create scope for accessing google drive api
				Set<String> scopes = new HashSet<>();
				scopes.add("https://www.googleapis.com/auth/drive");
				
				//Toto: 1. Authentication with google drive api
				GoogleCredential googleCredential = new GoogleCredential.Builder()
						.setTransport(new NetHttpTransport())
						.setJsonFactory(JacksonFactory.getDefaultInstance())
						.setServiceAccountId("khmerslide@khmerslide.iam.gserviceaccount.com")
						.setServiceAccountScopes(scopes)
						.setServiceAccountPrivateKeyFromP12File(new File("KhmerSLIDE-8e9f607824e4.p12"))
						.build();
				
				if(googleCredential.getAccessToken()==null){
					googleCredential.refreshToken();
				}
				System.out.println("ACCESS TOKEN == " + googleCredential.getAccessToken());
				
				Google google = new GoogleTemplate(googleCredential.getAccessToken());
				Category cat = new Category();
				System.out.println(cat.getCat_name());
				
				//Todo: 2.create folder in google drive
				DriveFile folder = google.driveOperations().createFolder("0B2WJOSpqcAkyNlQ3Vmd4b3BGTjQ", cat.getCat_name());
				folderId = folder.getId();
//				System.out.println(folder.getTitle());
//				System.out.println(folder.getId());
				return folderId;
	}
}
