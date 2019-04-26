/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.dao.vending;

import java.io.FileNotFoundException;

/**
 *
 * @author stephendowning
 */
public class VMachinePersistenceException extends Exception {

   public VMachinePersistenceException (String message) {
        super(message);
    }
    
    public VMachinePersistenceException (String message, Throwable cause) {
        super(message, cause);
    }
    
}
