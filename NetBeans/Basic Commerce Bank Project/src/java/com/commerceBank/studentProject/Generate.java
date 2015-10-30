/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commerceBank.studentProject;

import java.io.StringWriter;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import javax.security.auth.x500.X500Principal;
import org.bouncycastle.openssl.PEMWriter;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.bouncycastle.pkcs.PKCS10CertificationRequestBuilder;
import org.bouncycastle.pkcs.jcajce.JcaPKCS10CertificationRequestBuilder;
import org.bouncycastle.util.io.pem.PemObject;
/**
 *
 * @author Jackson
 */
public class Generate {
    
    String CSR;
    String PK;
    
    /**
     *
     * @param country
     * @param state
     * @param locality
     * @param organization
     * @param organizationUnit
     * @param commonName
     */
    public void generate(String country, String state, String locality, String organization, String organizationUnit, String commonName, String emailAddress) throws Exception{
        KeyPairGenerator gen = KeyPairGenerator.getInstance("RSA");
        gen.initialize(2048);
        KeyPair pair = gen.generateKeyPair();
        PrivateKey privateKey = pair.getPrivate();
        PublicKey publicKey = pair.getPublic();
        String dr = "C=" + country + ", ST=" + state + ", L=" + locality + ", O=" + organization + ", OU=" + organizationUnit + ", CN=" + commonName + ", EMAILADDRESS=" + emailAddress;
        X500Principal subject = new X500Principal (dr);
        ContentSigner signGen = new JcaContentSignerBuilder("SHA1withRSA").build(privateKey);
        
        PKCS10CertificationRequestBuilder builder = new JcaPKCS10CertificationRequestBuilder(subject, publicKey);
        PKCS10CertificationRequest csr = builder.build(signGen);
        
        PK = Base64.getEncoder().encodeToString(privateKey.getEncoded());;
        PemObject pemObject = new PemObject("CERTIFICATE REQUEST", csr.getEncoded());
        StringWriter str = new StringWriter();
        PEMWriter pemWriter = new PEMWriter(str);
        pemWriter.writeObject(pemObject);
        pemWriter.close();
        str.close();
        CSR = str.toString();
    }
    
    public String getPrivateKey(){
        return PK;
    }
    
    public String getCSR(){
        return CSR;
    }
}
