/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.dao.vending;

import com.sg.steveswebsite.model.vending.Item;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;


/**
 *
 * @author stephendowning
 */
public class vendingMachineDaoInMemImpl implements vendingMachineDao {

    public static final String DELIMITER = "::";
    public static final String NEW_FILE = "menu.txt";
    private Map<String, Item> items = new HashMap<>();

    @Override
    public List<Item> getAllItems() {

        loadMenu();

        return new ArrayList<Item>(items.values());
    }

    @Override
    public Item getItem(String itemId) {

        loadMenu();

        if (items.get(itemId) != null) {
            return items.get(itemId);
        } else {
            return null;
        }
    }

    @Override
    public Item addItem(String itemId, Item item) {
        Item newItem = items.put(itemId, item);
        writeMenu();
        return newItem;
    }

    private void loadMenu() {
        Scanner scanner = null;

        try {
            scanner = new Scanner(
                    new BufferedReader(
                            new FileReader(NEW_FILE)));
        } catch (FileNotFoundException e) {

        }

        String currentLine;
        String[] currentTokens;

        while (scanner.hasNextLine()) {
            currentLine = scanner.nextLine();

            currentTokens = currentLine.split(DELIMITER);

            Item currentItem = new Item(currentTokens[0]);

            currentItem.setItemName(currentTokens[1]);
            currentItem.setItemPrice(Double.parseDouble(currentTokens[2]));
            currentItem.setItemQuantity(Integer.parseInt(currentTokens[3]));

            items.put(currentItem.getItemId(), currentItem);
        }

        scanner.close();
    }

    private void writeMenu()  {
        PrintWriter out = null;

        try {
            out = new PrintWriter(new FileWriter(NEW_FILE));
        } catch (IOException e) {
 
        }

        List<Item> itemList = this.getAllItems();
        for (Item currentItem : itemList) {

            out.println(currentItem.getItemId() + DELIMITER
                    + currentItem.getItemName() + DELIMITER
                    + currentItem.getItemPrice() + DELIMITER
                    + currentItem.getItemQuantity() + DELIMITER);

            out.flush();
        }
        out.close();
    }
}
