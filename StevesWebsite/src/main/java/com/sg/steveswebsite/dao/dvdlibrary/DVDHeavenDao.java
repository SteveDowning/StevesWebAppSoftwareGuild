/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.dao.dvdlibrary;


import com.sg.steveswebsite.model.dvdLibrary.Dvd;
import java.util.List;

/**
 *
 * @author stephendowning
 */
public interface DVDHeavenDao {
    
   Dvd addDvd(String dvdTitle, Dvd dvd);
            
    List<Dvd> getAllDvds();
            
    Dvd getDvd(String dvdTitle);
            
    List<Dvd> searchDvds(String str); 

    void removeDvd(String dvdTitle);
                

    List<Dvd> getDvdsByRating(String MpaaRating);
           

    List<Dvd> getDvdsByDirector(String Director);
            

    List<Dvd> getDvdByStudio(String Studio);
           
    
}
