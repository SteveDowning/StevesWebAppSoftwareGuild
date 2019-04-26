/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.dao.dvdlibrary;


import com.sg.steveswebsite.model.dvdLibrary.Dvd;
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
public class DVDHeavenDaoFileImpl implements DVDHeavenDao {

    public static final String LIBRARY2_FILE = "DvdHeaven.txt";
    public static final String DELIMITER = "::";
    private Map<String, Dvd> dvds = new HashMap<>();

    @Override
    public Dvd addDvd(String dvdTitle, Dvd dvd) {

        dvds.put(dvdTitle, dvd);
        writeLibrary();
        return dvd;
    }

    @Override
    public List<Dvd> getAllDvds() {
        loadLibrary();
        return new ArrayList<Dvd>(dvds.values());
    }

    @Override
    public Dvd getDvd(String dvdTitle) {
        loadLibrary();
        return dvds.get(dvdTitle);

    }

    @Override
    public List<Dvd> searchDvds(String str) {
        loadLibrary();
        ArrayList<Dvd> dvdList = new ArrayList<>();
        for (String key : dvds.keySet()) {
            if (key.toLowerCase().contains(str.toLowerCase())) {
                Dvd value = dvds.get(key);
                dvdList.add(value);
            }
        }
        return dvdList;
    }

    @Override
    public void removeDvd(String dvdTitle) {
        dvds.remove(dvdTitle);
        writeLibrary();
    }

    @Override
    public List<Dvd> getDvdsByRating(String MpaaRating) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Dvd> getDvdsByDirector(String Director) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Dvd> getDvdByStudio(String Studio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void loadLibrary() {
        Scanner scanner = null;

        try {
            scanner = new Scanner(new BufferedReader(new FileReader(LIBRARY2_FILE)));
        } catch (FileNotFoundException e) {
            
        }

        String currentLine;

        String[] currentTokens;

        while (scanner.hasNextLine()) {
            currentLine = scanner.nextLine();
            currentTokens = currentLine.split(DELIMITER);

            Dvd currentDvd = new Dvd();
            currentDvd.setDvdTitle(currentTokens[0]);
            currentDvd.setReleaseDate(currentTokens[1]);
            currentDvd.setMpaaRating(currentTokens[2]);
            currentDvd.setDirectorsName(currentTokens[3]);
            currentDvd.setStudio(currentTokens[4]);
            currentDvd.setUserNote(currentTokens[5]);

            dvds.put(currentDvd.getDvdTitle(), currentDvd);
        }
        scanner.close();
    }

    private void writeLibrary() {

        PrintWriter out = null;

        try {
            out = new PrintWriter(new FileWriter(LIBRARY2_FILE));
        } catch (IOException e) {

        }
        List<Dvd> dvdList = this.getAllDvds();
        for (Dvd currentDvd : dvdList) {
            out.println(currentDvd.getDvdTitle() + DELIMITER
                    + currentDvd.getReleaseDate() + DELIMITER
                    + currentDvd.getMpaaRating() + DELIMITER
                    + currentDvd.getDirectorsName() + DELIMITER
                    + currentDvd.getStudio() + DELIMITER
                    + currentDvd.getUserNote());

            out.flush();
        }
        out.close();
    }

}
