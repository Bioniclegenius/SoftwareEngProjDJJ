/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commerceBank.studentProject;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.security.KeyFactory;
import java.security.cert.Certificate;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.CertificateFactory;
import java.security.spec.PKCS8EncodedKeySpec;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Jackson
 */
public class CreateKeystore {
    
    KeyStore key;
    
    public void makeKeystore(String cert, String pk, String ps, String alias) throws Exception{
        KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
        // get user password and file input stream
        char[] password = ps.toCharArray();

        //FileInputStream fis = null;
        try {
            //fis = new java.io.FileInputStream(new File("test.jks"));//System.io.Path.getTempPath() + "test.jks");
            //Use Temp directory to save file and download it!
            //ks.load(fis, password);
            ks.load(null, null);
            
            // Add the certificate
            //insert Chars "\r\n" after --Begin Certificate--
            int index = cert.indexOf("-----BEGIN CERTIFICATE-----");
            index += 27;//Length of above string
            cert = cert.substring(0, index) + "\r\n" + cert.substring(index + 1);
            CertificateFactory cf = CertificateFactory.getInstance("X.509");
            ByteArrayInputStream cif = new ByteArrayInputStream(cert.getBytes("UTF-8"));
            Certificate certs = (Certificate) cf.generateCertificate(cif);
            ks.setCertificateEntry(alias, certs);
            
            // Add the Private key
            byte[] encodedKey = new byte[(int)pk.length()];
            InputStream keyInputStream = new ByteArrayInputStream(pk.getBytes());
            keyInputStream.read(encodedKey);
            keyInputStream.close();
            KeyFactory rSAKeyFactory = KeyFactory.getInstance("X.509");
            PrivateKey privateKey = rSAKeyFactory.generatePrivate(new PKCS8EncodedKeySpec(encodedKey));
            ks.setEntry(alias, new KeyStore.PrivateKeyEntry(privateKey, null), null);

            // Save the new keystore contents
            FileOutputStream out = new FileOutputStream("test.jks");
            ks.store(out, password);
            out.close();
            key = ks;
        } finally {
        }
        
    }
    
    public KeyStore getKey(){
        return key;
    }
}
