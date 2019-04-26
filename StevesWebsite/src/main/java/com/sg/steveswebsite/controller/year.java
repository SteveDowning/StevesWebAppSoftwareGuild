/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.controller;


import java.math.BigDecimal;

/**
 *
 * @author stephendowning
 */
public class year {
    int yearNumber;
    private BigDecimal begPrincipal;
    private BigDecimal annInterest;
    private BigDecimal yearEndBal;
    
    public year(){
   
    }

    public int getYearNumber() {
        return yearNumber;
    }

    public void setYearNumber(int yearNumber) {
        this.yearNumber = yearNumber;
    }

    public BigDecimal getBegPrincipal() {
        return begPrincipal;
    }

    public void setBegPrincipal(BigDecimal begPrincipal) {
        this.begPrincipal = begPrincipal;
    }

    public BigDecimal getAnnInterest() {
        return annInterest;
    }

    public void setAnnInterest(BigDecimal annInterest) {
        this.annInterest = annInterest;
    }

    public BigDecimal getYearEndBal() {
        return yearEndBal;
    }

    public void setYearEndBal(BigDecimal yearEndBal) {
        this.yearEndBal = yearEndBal;
    }
    
    
}
