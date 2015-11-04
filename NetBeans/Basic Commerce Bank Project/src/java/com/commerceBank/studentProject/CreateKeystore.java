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
import java.security.cert.Certificate;
import java.security.KeyStore;
import java.security.cert.CertificateFactory;

/**
 *
 * @author Jackson
 */
public class CreateKeystore {
    public void makeKeystore(String cert, String pk, String ps, String alias) throws Exception{
        KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
        // get user password and file input stream
        char[] password = ps.toCharArray();

        FileInputStream fis = null;
        try {
            fis = new java.io.FileInputStream("keyStoreName");
            ks.load(fis, password);
            
            // Add the certificate
            CertificateFactory cf = CertificateFactory.getInstance("X.509");
            InputStream cif = new ByteArrayInputStream(cert.getBytes());
            Certificate certs = (Certificate) cf.generateCertificate(cif);
            ks.setCertificateEntry(alias, certs);
            
            // Add the Private key
            //Check out this page https://www.nealgroothuis.name/import-a-private-key-into-a-java-keystore/

            // Save the new keystore contents
            FileOutputStream out = new FileOutputStream("name.keystore");
            ks.store(out, password);
            out.close();
        } finally {
            if (fis != null) {
                fis.close();
            }
        }
        
    }
}
