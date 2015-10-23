/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commerceBank.studentProject;

import java.security.KeyPair;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.*;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.bouncycastle.pkcs.PKCS10CertificationRequestBuilder;
import org.bouncycastle.pkcs.jcajce.JcaPKCS10CertificationRequestBuilder;
/**
 *
 * @author Jackson
 */
public class Generate {
    
    String CSR = "", PK = "";
    
    public void generate(String country, String state, String locality, String organization, String organizationUnit, String commonName){
        /*KeyPair pair = generateKeyPair();
        PKCS10CertificationRequestBuilder p10Builder = new JcaPKCS10CertificationRequestBuilder(
        new X500Principal("CN=Requested Test Certificate"), pair.getPublic());
        JcaContentSignerBuilder csBuilder = new JcaContentSignerBuilder("SHA256withRSA");
        ContentSigner signer = csBuilder.build(pair.getPrivate());
        PKCS10CertificationRequest csr = p10Builder.build(signer);*/
        PK = "abcd";
        CSR = "1234";//csr.toString();
    }
    
    public String getPrivateKey(){
        return PK;
    }
    
    public String getCSR(){
        return CSR;
    }
}
