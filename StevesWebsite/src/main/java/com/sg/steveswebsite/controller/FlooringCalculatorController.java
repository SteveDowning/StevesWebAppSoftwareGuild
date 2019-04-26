/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.controller;


import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author stephendowning
 */
@Controller
@RequestMapping(value="/flooring")
public class FlooringCalculatorController {
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String flooringHome(Model model){
        return "calculators/flooringIndex";
    }
    
   @RequestMapping(value ="/calculateJob", method =RequestMethod.POST) 
    public String calculateJob (HttpServletRequest request,
            Map<String, Object> model){
        
        
        String input = request.getParameter("areaLength");
        BigDecimal arealength = null;
        //validate incoming number
        try{
        arealength = new BigDecimal(input);
        
        }catch(NumberFormatException ex){
            model.put("errorMessage", "Error: Please enter a valid number!");
            model.put("extantInput", input);
            return "calculators/flooringIndex";
        }
        BigDecimal length = new BigDecimal(request.getParameter("areaLength")).setScale(2, RoundingMode.HALF_UP);
        
        String input2 = request.getParameter("areaWidth");
        BigDecimal areaWidth = null;
        //validate incoming number
        try{
        areaWidth = new BigDecimal(input2);
        
        }catch(NumberFormatException ex){
            model.put("errorMessage2", "Error: Please enter a valid number!");
            model.put("extantInput2", input2);
            return "calculators/flooringIndex";
        }  
        BigDecimal width = new BigDecimal(request.getParameter("areaWidth")).setScale(2, RoundingMode.HALF_UP);
        
        
        
        
        String input3 = request.getParameter("costPSF");
        BigDecimal matCostPSF = null;
        //validate incoming number
        try{
        matCostPSF = new BigDecimal(input3);
        
        }catch(NumberFormatException ex){
            model.put("errorMessage3", "Error: Please enter a valid number!");
            model.put("extantInput3", input3);
            return "calculators/flooringIndex";
        }  
        BigDecimal costPSF = new BigDecimal(request.getParameter("costPSF")).setScale(2, RoundingMode.HALF_UP);
        
        
        
        BigDecimal area = width.multiply(length).setScale(2, RoundingMode.HALF_UP);     
        BigDecimal eightySix = new BigDecimal("86").setScale(2, RoundingMode.HALF_UP);
        BigDecimal twenty = new BigDecimal("20").setScale(2, RoundingMode.HALF_UP);
        
        BigDecimal time = area.divide(twenty).setScale(2, RoundingMode.HALF_UP);
        BigDecimal totalLabor= area.divide(twenty).multiply(eightySix).setScale(2, RoundingMode.HALF_UP);
        BigDecimal totalMatCost = area.multiply(costPSF).setScale(2, RoundingMode.HALF_UP);
        
        BigDecimal totalCost = totalLabor.add(totalMatCost).setScale(2, RoundingMode.HALF_UP);
        
       
        model.put("widthKey", width);
        model.put("lengthKey", length);
        model.put("costPSFKey", costPSF);
        
        model.put("areaKey", area);
        model.put("timeKey", time);
        model.put("totalLaborKey", totalLabor);
        model.put("totalMatCostKey", totalMatCost);
        model.put("totalCostKey", totalCost);
        return "calculators/flooringResult";
        
    }
}
