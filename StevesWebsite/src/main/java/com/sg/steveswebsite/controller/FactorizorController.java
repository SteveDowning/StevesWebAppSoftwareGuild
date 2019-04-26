/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.aspectj.bridge.MessageUtil;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author stephendowning
 */
@Controller
@RequestMapping(value="/factorizor")
public class FactorizorController {
    
 @RequestMapping(value="/", method=RequestMethod.GET)
    public String factorizorHome(Model model){
        return "calculators/factorizorIndex";
    }

    @RequestMapping(value = "/factorNumber",
            method = RequestMethod.POST)
    public String factorNumber(HttpServletRequest request,
            Map<String, Object> model) {

        List<Integer> factorList = new ArrayList<>();

        int factorSum = 0;
        boolean isPrime = false;
        boolean isPerfect = false;
        
        
        
        
        String input = request.getParameter("numberToFactor");
        int numberToFactor = 0;
        //validate incoming number
        try{
        numberToFactor = Integer.parseInt(input);
        
        }catch(NumberFormatException ex){
            model.put("errorMessage", "Please enter a valid number");
            model.put("extantInput", input);
            return "calculators/factorizorIndex";
        }

        for (int i = 1; i < numberToFactor; i++) {
            if (numberToFactor % i == 0) {

                factorList.add(i);
                factorSum +=i;
            }
        }
        
        if(factorSum == numberToFactor) {
            isPerfect = true;
        }
        
        if(factorSum == 1) {
            isPrime = true;
        }

        model.put("numberToFactorKey", numberToFactor);
        model.put("factorsKey", factorList);
        model.put("isPrimeKey", isPrime);
        model.put("isPerfectKey", isPerfect);
        return "calculators/factorizorResult";
    }
    
}
