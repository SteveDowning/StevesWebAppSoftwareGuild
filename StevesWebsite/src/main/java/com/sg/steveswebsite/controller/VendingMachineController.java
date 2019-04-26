/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.controller;

import com.sg.steveswebsite.dao.vending.vendingMachineDao;
import com.sg.steveswebsite.model.vending.Item;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import javax.inject.Inject;
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
@RequestMapping(value = "/vending")
public class VendingMachineController {

    private vendingMachineDao dao;
    private double change;
    private double currentMoney = 0;
    //This BD conversion will not work here because BD is immutable. Once set, 
    //it can't change or iterate.
    //BigDecimal BDCurrentMoney = new BigDecimal(currentMoney).setScale(2, RoundingMode.HALF_UP);
    private String currentId;
    private String message;

    @Inject
    public VendingMachineController(vendingMachineDao dao) {
        this.dao = dao;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String goHome(Model model) {

        List<Item> itemListTest = dao.getAllItems();
        model.addAttribute("itemList", itemListTest);
        //instantiate the BigDecimal here rather than above with the global variables
        //because Bigdecimal is inmutable
        model.addAttribute("currentMoney", new BigDecimal(currentMoney).setScale(2, RoundingMode.HALF_UP));
        model.addAttribute("currentId", currentId);
        model.addAttribute("change", new BigDecimal(change).setScale(2, RoundingMode.HALF_UP));
        model.addAttribute("message", message);

        return "vendingMachine/home";
    }

    @RequestMapping(value = "addDollar", method = RequestMethod.GET)
    public String addDollar() {
        currentMoney += 1;
        return "redirect:/vending/";
    }

    @RequestMapping(value = "addQuarter", method = RequestMethod.GET)
    public String addQuarter() {
        currentMoney += .25;
        return "redirect:/vending/";
    }

    @RequestMapping(value = "addDime", method = RequestMethod.GET)
    public String addDime() {
        currentMoney += .10;
        return "redirect:/vending/";
    }

    @RequestMapping(value = "addNickel", method = RequestMethod.GET)
    public String addNickel() {
        currentMoney += .05;
        return "redirect:/vending/";
    }

    //see lesson 6 of code along for syntax
    //pulls value from a href="getCurrentItemId" and sticks it in the "item box" div
    //see "item Box" at home.jsp for the EL syntax -${currentId}-that requests the object from the model above
    @RequestMapping(value = "getCurrentItemId", method = RequestMethod.GET)
    public String getCurrentItemId(HttpServletRequest request, Model model) {
        
        if(change!=0){
            currentMoney = change;
            change=0;
        }
        String currentItemIdParameter = request.getParameter("itemId");
        String itemId = currentItemIdParameter;

        currentId = itemId;

        return "redirect:/vending/";
    }

    @RequestMapping(value = "purchase", method = RequestMethod.GET)
    public String makeChange() {

        Item currentItem = dao.getItem(currentId);

        if (currentId == null) {
            message = "Please select an item";
            return "redirect:/vending/";
        
        }else if (currentMoney >= currentItem.getItemPrice()
                && currentItem.getItemQuantity() > 0) {

            vendItem(currentItem);
            return "redirect:/vending/";
        } else if (currentMoney < currentItem.getItemPrice()
                && currentItem.getItemQuantity() > 0) {
            RequestMoMoney(currentItem);
            return "redirect:/vending/";
        } else if (currentItem.getItemQuantity() <= 0) {
            currentMoney = currentMoney;
            currentId = null;
            message = "Out of Stock";
        }
        return "redirect:/vending/";
    }

    private void RequestMoMoney(Item currentItem) {
        currentMoney = currentMoney;
        currentId = currentItem.getItemId();
        double balance = currentItem.getItemPrice() - currentMoney;
        message = "Please add $ " + new BigDecimal(balance).setScale(2, RoundingMode.HALF_UP);
    }

    private void vendItem(Item currentItem) {
        change = currentMoney - currentItem.getItemPrice();
        currentMoney = 0;
        currentId = null;
        message = "Thank You!";

        int updatedItem = currentItem.getItemQuantity() - 1;
        currentItem.setItemQuantity(updatedItem);
        dao.addItem(currentItem.getItemId(), currentItem);

    }

    @RequestMapping(value = "change", method = RequestMethod.GET)
    public String returnChange() {
        currentId = null;
        message = "";
        currentMoney = 0;
        change = 0;
        return "redirect:/vending/";
    }

}
