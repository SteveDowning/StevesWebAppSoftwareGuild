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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author stephendowning
 */
@Controller
@RequestMapping(value = "/tip")
public class TipController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showTip(Map<String, Object> model) {
        return "calculators/tipIndex";
    }

    @RequestMapping(value = "/calculateTip", method = RequestMethod.POST)
    public String calculateTip(HttpServletRequest request,
            Map<String, Object> model) {

        String input = request.getParameter("billTotal");
        BigDecimal billTotal = null;
        try {
            billTotal = new BigDecimal(input);

        } catch (NumberFormatException ex) {
            model.put("errorMessage", "Error: Please enter a valid number!");
            model.put("extantInput", input);
            return "calculators/tipIndex";
        }
        BigDecimal bill = new BigDecimal(request.getParameter("billTotal")).setScale(2, RoundingMode.HALF_UP);

        String input2 = request.getParameter("percentTip");
        BigDecimal percentTip = null;
        try {
            percentTip = new BigDecimal(input2);
        } catch (NumberFormatException ex) {
            model.put("errorMessage2", "Error: Please enter a valid number!");
            model.put("extantInput2", input2);
            return "calculators/tipIndex";
        }
        BigDecimal percent = new BigDecimal(request.getParameter("percentTip")).setScale(2, RoundingMode.HALF_UP);

        BigDecimal hundred = new BigDecimal("100").setScale(2, RoundingMode.HALF_UP);

        BigDecimal tip = percent.divide(hundred).multiply(bill).setScale(2, RoundingMode.HALF_UP);
        BigDecimal total = bill.add(tip).setScale(2, RoundingMode.HALF_UP);

        model.put("billKey", bill);
        model.put("percentKey", percent);
        model.put("tipKey", tip);
        model.put("totalKey", total);

        return "calculators/tipResult";
    }

}
