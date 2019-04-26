/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.dao.vending;

import com.sg.steveswebsite.model.vending.Item;
import java.util.List;


/**
 *
 * @author stephendowning
 */
public interface vendingMachineDao {
    
 public List<Item> getAllItems();
 
 public Item addItem(String itemId, Item item);
 
 public Item getItem(String itemId) ;
         
}
