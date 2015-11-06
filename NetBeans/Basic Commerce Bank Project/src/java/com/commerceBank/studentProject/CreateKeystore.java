/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commerceBank.studentProject;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.KeyFactory;
import java.security.cert.Certificate;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.CertificateFactory;
import java.security.spec.PKCS8EncodedKeySpec;

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
            //fis = new java.io.FileInputStream("test.jks");//System.io.Path.getTempPath() + "test.jks");
            //Use Temp directory to save file and download it!
            //ks.load(fis, password);
            
            // Add the certificate
            CertificateFactory cf = CertificateFactory.getInstance("X.509");
            InputStream cif = new ByteArrayInputStream(cert.getBytes());
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
