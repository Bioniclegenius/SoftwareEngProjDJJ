/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commerceBank.studentProject;

import org.bouncycastle.pkcs.*;
/**
 *
 * @author Jackson
 */
public class Generate {
    
    String CSR = "", PK = "";
    
    public void generate(String country, String state, String locality, String organization, String organizationUnit, String commonName){
        PK = "abcd";
        CSR = "1234";
    }
    
    public String getPrivateKey(){
        return PK;
    }
    
    public String getCSR(){
        return CSR;
    }
}
