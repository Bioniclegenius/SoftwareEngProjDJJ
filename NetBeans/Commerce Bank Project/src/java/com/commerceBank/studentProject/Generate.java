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
import javax.security.auth.x500.X500Principal;
import org.bouncycastle.openssl.PEMWriter;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.bouncycastle.pkcs.PKCS10CertificationRequestBuilder;
import org.bouncycastle.pkcs.jcajce.JcaPKCS10CertificationRequestBuilder;
import org.bouncycastle.util.io.pem.PemObject;
import org.bouncycastle.util.io.pem.PemWriter;
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
    public void generate(String country, String state, String locality, String organization, String organizationUnit, String commonName, String altName) throws Exception{
        KeyPairGenerator gen = KeyPairGenerator.getInstance("RSA");
        gen.initialize(2048);
        KeyPair pair = gen.generateKeyPair();
        PrivateKey privateKey = pair.getPrivate();
        PublicKey publicKey = pair.getPublic();
        String dr = "C=" + country + ", ST=" + state + ", L=" + locality + ", O=" + organization + ", OU=" + organizationUnit + ", CN=" + commonName;
        X500Principal subject = new X500Principal (dr);
        ContentSigner signGen = new JcaContentSignerBuilder("SHA1withRSA").build(privateKey);
        
        PKCS10CertificationRequestBuilder builder = new JcaPKCS10CertificationRequestBuilder(subject, publicKey);
        
        /*//Subject Alternate names
        GeneralNames subjectAltName = new GeneralNames(new 
        GeneralName(GeneralName.rfc822Name, altName)); 
        Vector oids = new Vector(); 
        Vector values = new Vector(); 
        oids.add(X509Extensions.SubjectAlternativeName); 
        values.add(new X509Extension(false, new DEROctetString(subjectAltName))); 
        X509Extensions extensions = new X509Extensions(oids, values); 
        builder.addAttribute(PKCSObjectIdentifiers.pkcs_9_at_extensionRequest, new 
        DERSet(extensions));        
        */
        PKCS10CertificationRequest csr = builder.build(signGen);
        
        //PrivateKey to String
        PemObject pemObject = new PemObject("RSA PRIVATE KEY", privateKey.getEncoded());
        StringWriter stringWriter = new StringWriter();
        PemWriter pemWriter = new PemWriter(stringWriter);
        pemWriter.writeObject(pemObject);
        pemWriter.close();
        PK = stringWriter.toString();
        
        
        //CSR to String NOTE: Reuses object names from PrivateKey to String
        pemObject = new PemObject("CERTIFICATE REQUEST", csr.getEncoded());
        StringWriter str = new StringWriter();
        pemWriter = new PEMWriter(str);//PEMWriter
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
