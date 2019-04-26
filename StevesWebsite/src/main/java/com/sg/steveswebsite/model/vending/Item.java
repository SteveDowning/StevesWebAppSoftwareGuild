/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.model.vending;

/**
 *
 * @author stephendowning
 */
public class Item {
    
    private String itemId;
    private String itemName;
    private double itemPrice;
    private int itemQuantity;

    public Item(String itemId) {
        this.itemId=itemId;
   }

    public String getItemId() {
        return itemId;
    }


    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public int getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }
    
    
    
    
}
