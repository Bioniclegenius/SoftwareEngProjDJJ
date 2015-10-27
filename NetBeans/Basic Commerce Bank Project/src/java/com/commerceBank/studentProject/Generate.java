/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commerceBank.studentProject;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import javax.security.auth.x500.X500Principal;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.bouncycastle.pkcs.PKCS10CertificationRequestBuilder;
import org.bouncycastle.operator.jcajce.*;
import org.bouncycastle.pkcs.jcajce.JcaPKCS10CertificationRequestBuilder;
/**
 *
 * @author Jackson
 */
public class Generate {
    
    String CSR = "", PK = "";
    
    /**
     *
     * @param country
     * @param state
     * @param locality
     * @param organization
     * @param organizationUnit
     * @param commonName
     */
    public void generate(String country, String state, String locality, String organization, String organizationUnit, String commonName) throws Exception{
        KeyPairGenerator gen = KeyPairGenerator.getInstance("RSA");
        gen.initialize(2048);
        KeyPair pair = gen.generateKeyPair();
        PrivateKey privateKey = pair.getPrivate();
        PublicKey publicKey = pair.getPublic();
        X500Principal subject = new X500Principal ("C=NO, ST=Trondheim, L=Trondheim, O=Senthadev, OU=Innovation, CN=www.senthadev.com, EMAILADDRESS=senthadev@gmail.com");
        ContentSigner signGen = new JcaContentSignerBuilder("SHA1withRSA").build(privateKey);
        PKCS10CertificationRequestBuilder builder = new JcaPKCS10CertificationRequestBuilder(subject, publicKey);
        PKCS10CertificationRequest csr = builder.build(signGen);
        
        PK = privateKey.toString();
        CSR = csr.toString();
        
/*Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
        X500Name x500 = new X500Name("CN=..."); //enter your DN here
        CertificationRequestInfo csrInfo = new CertificationRequestInfo(x500, publicKeyInfo, new DERSet()); //you must instantiate publicKeyInfo beforehand
        UnsignedPkcs10CertificationRequest pkcs10 = new UnsignedPkcs10CertificationRequest(csrInfo);*/

        /*KeyPair pair = generateKeyPair();
        PKCS10CertificationRequestBuilder p10Builder = new JcaPKCS10CertificationRequestBuilder(
        new X500Principal("CN=Requested Test Certificate"), pair.getPublic());
        JcaContentSignerBuilder csBuilder = new JcaContentSignerBuilder("SHA256withRSA");
        ContentSigner signer = csBuilder.build(pair.getPrivate());
        PKCS10CertificationRequest csr = p10Builder.build(signer);*/
        //PK = "abcd";
        //CSR = "1234";//csr.toString();
    }
    
    public String getPrivateKey(){
        return PK;
    }
    
    public String getCSR(){
        return CSR;
    }
}
