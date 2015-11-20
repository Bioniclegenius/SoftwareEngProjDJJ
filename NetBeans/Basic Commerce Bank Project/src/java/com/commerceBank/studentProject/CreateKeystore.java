/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commerceBank.studentProject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.KeyFactory;
import java.security.cert.Certificate;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.CertificateFactory;
import java.security.spec.PKCS8EncodedKeySpec;
import org.bouncycastle.util.encoders.Base64;

/**
 *
 * @author Jackson
 */
public class CreateKeystore {
    
    KeyStore key;
    byte[] keyStore;
    File file;
    private final String CERT_START = "-----BEGIN CERTIFICATE-----";
    private final String RSA_START = "-----BEGIN RSA PRIVATE KEY-----";
    private final String RSA_END = "-----END RSA PRIVATE KEY-----";
    
    public void makeKeystore(String cert, String pk, String ps, String alias) throws Exception{
        KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
        // get user password and file input stream
        char[] password = ps.toCharArray();

        try {
            
            ks.load(null, null);
            
            // Add the certificate
            int index = cert.indexOf(CERT_START);
            index += CERT_START.length();//to insert string after the start
            cert = cert.substring(0, index) + "\r\n" + cert.substring(index + 1);//Error thrown if string not entered
            CertificateFactory cf = CertificateFactory.getInstance("X.509");
            ByteArrayInputStream cif = new ByteArrayInputStream(cert.getBytes("UTF-8"));
            Certificate certs = (Certificate) cf.generateCertificate(cif);
            ks.setCertificateEntry(alias, certs);
            
            // Add the Private key
            int startIndex = pk.indexOf(RSA_START);
            startIndex += RSA_START.length();
            int endIndex = pk.indexOf(RSA_END);
            pk = pk.substring(startIndex, endIndex);
            byte[] encodedKey = new byte[(int)pk.length()];
            InputStream keyInputStream = new ByteArrayInputStream(pk.getBytes());
            keyInputStream.read(encodedKey);
            keyInputStream.close();
            KeyFactory rsaKeyFactory = KeyFactory.getInstance("RSA");
            PKCS8EncodedKeySpec ksp = new PKCS8EncodedKeySpec(Base64.decode(pk));
            PrivateKey privateKey = rsaKeyFactory.generatePrivate(ksp);
            
            KeyStore.ProtectionParameter protParam = new KeyStore.PasswordProtection(password);
            Certificate[] chain = new Certificate[1];
            chain[0] = certs;
            KeyStore.PrivateKeyEntry pkEntry = new KeyStore.PrivateKeyEntry(privateKey, chain);
            ks.setEntry(alias, pkEntry, protParam);
            // Save the new keystore contents
            /*File file = new File ("test.keystore");
            FileOutputStream out2 = new FileOutputStream(file);
            ks.store(out2, password);
            out2.close();
            key = ks;
                    */
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            ks.store(out, password);
            //keyStore = "";
            keyStore = out.toByteArray();
            out.close();
            
        } finally {
            
        }    
    }
    
    public KeyStore getKey(){
        return key;
    }
    
    public byte[] getKeyStore(){
        return keyStore;
    }
}
