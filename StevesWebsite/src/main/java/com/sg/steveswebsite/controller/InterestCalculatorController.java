/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.controller;


import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author stephendowning
 */
@Controller
@RequestMapping(value="/interest")
public class InterestCalculatorController {
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showInterest(Map<String, Object> model) {
        return "calculators/interestCalculatorIndex";
    }
    
    @RequestMapping(value = "/calculateInterest", method = RequestMethod.POST)
    
    public String calculateInterest (HttpServletRequest request,
            Map<String, Object> model) {
        List<year> yearList = new ArrayList<>();
        
        String input = request.getParameter("currentBal");
        BigDecimal currentBal = null;
        //validate incoming number
        try{
        currentBal = new BigDecimal(input);
        
        }catch(NumberFormatException ex){
            model.put("errorMessage", "Error: Please enter a valid number!");
            model.put("extantInput", input);
            return "calculators/interestCalculatorIndex";
        }        
        BigDecimal currBal = new BigDecimal(request.getParameter("currentBal")).setScale(2, RoundingMode.HALF_UP);
        
        
        String input2 = request.getParameter("interestRate");
        BigDecimal interestRate = null;
        //validate incoming number
        try{
        interestRate = new BigDecimal(input2);
        
        }catch(NumberFormatException ex){
            model.put("errorMessage2", "Error: Please enter a valid number!");
            model.put("extantInput2", input2);
            return "calculators/interestCalculatorIndex";
        }   
        BigDecimal intRate = new BigDecimal(request.getParameter("interestRate")).setScale(2, RoundingMode.HALF_UP);
        
        
        
        String input3 = request.getParameter("investmentTerm");
        int investmentTerm = 0;
        //validate incoming number
        try{
        investmentTerm = Integer.parseInt(input3);
        
        }catch(NumberFormatException ex){
            model.put("errorMessage3", "Error: Please enter a valid number!");
            model.put("extantInput3", input3);
            return "calculators/interestCalculatorIndex";
        }  
        int term = Integer.parseInt(request.getParameter("investmentTerm"));
        
        BigDecimal quarterInt = intRate.divide(new BigDecimal(4).setScale(2, RoundingMode.HALF_UP));
        BigDecimal yrEndBal = new BigDecimal(0);
        
        
        int yearNumber;
        
        request.setAttribute("currBalKey", currBal);
        request.setAttribute("intRateKey", intRate);
        request.setAttribute("termKey", term);

        for(int i = 1; i <=term; i++){
            yearNumber = +i;
            year yr = new year();
            yr.setYearNumber(i);
            yr.setBegPrincipal(currBal.setScale(2, RoundingMode.HALF_UP));
            
            for(int j = 1; j<=4; j++){
                currBal = currBal.multiply((quarterInt.divide(new BigDecimal(100).setScale(2, RoundingMode.HALF_UP))).add(new BigDecimal(1).setScale(2, RoundingMode.HALF_UP)));
                yr.setYearEndBal(currBal.setScale(2, RoundingMode.HALF_UP));
                yr.setAnnInterest(yr.getYearEndBal().subtract(yr.getBegPrincipal().setScale(2, RoundingMode.HALF_UP)));
            }
            yearList.add(yr);
        }
        
        model.put("yearListKey", yearList);
        
        return "calculators/interestCalculatorResult";
    }
    
    
}
