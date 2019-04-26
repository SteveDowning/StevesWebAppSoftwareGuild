/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.controller;


import com.sg.steveswebsite.dao.dvdlibrary.DVDHeavenDao;
import com.sg.steveswebsite.model.dvdLibrary.Dvd;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author stephendowning
 */
@Controller
@RequestMapping(value = "/Dvd")
public class DvdController {

    DVDHeavenDao dao;
    private String errorMessage;

    @Inject
    public DvdController(DVDHeavenDao dao) {
        this.dao = dao;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String goHome(Model model) {

        List<Dvd> dvdList = dao.getAllDvds();
        model.addAttribute("dvdList", dvdList);
        model.addAttribute("errorMessage", errorMessage);
        errorMessage = "";
        return "DvdLibrary/home";
    }

    @RequestMapping(value = "/displayCreateDvdPage", method = RequestMethod.GET)
    public String displayCreateDvdPage(Model model) {

        if (!model.containsAttribute("dvd")) {
            model.addAttribute("dvd", new Dvd());
        }
        return "DvdLibrary/createDvd";
    }

    @RequestMapping(value = "/createDvd", method = RequestMethod.POST)
    public String createDvd(@Valid @ModelAttribute("dvd") Dvd dvd,
            BindingResult result, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("dvd", dvd);
            return "DvdLibrary/createDvd";
        }

        //       Dvd dvd = new Dvd();
//        dvd.setDvdTitle(request.getParameter("enterTitle"));
//        dvd.setReleaseDate(request.getParameter("enterReleaseYear"));
//        dvd.setDirectorsName(request.getParameter("enterDirector"));
//        dvd.setMpaaRating(request.getParameter("enterRating"));
//        dvd.setStudio(request.getParameter("enterStudio"));
//        dvd.setUserNote(request.getParameter("enterNote"));
        dao.addDvd(dvd.getDvdTitle(), dvd);

        return "redirect:/Dvd/";
    }

    @RequestMapping(value = "/searchDvds", method = RequestMethod.POST)
    public String searchDvds(HttpServletRequest request, Model model) {

        String searchTerm = request.getParameter("searchTerm");
        List<Dvd> dvdList = dao.searchDvds(searchTerm);

        if (dvdList.size() == 0) {
            errorMessage = "No such DVD in the database.";
            return "redirect:/Dvd/";
        }

        model.addAttribute("dvdList", dvdList);
        return "DvdLibrary/searchResults";
    }

    @RequestMapping(value = "/displayDvdDetails", method = RequestMethod.GET)
    public String displayDvdDetails(HttpServletRequest request, Model model) {
        String DvdTitle = request.getParameter("DvdTitle");

        Dvd dvd = dao.getDvd(DvdTitle);
        model.addAttribute("dvd", dvd);
        return "DvdLibrary/dvdDetails";
    }

    @RequestMapping(value = "/deleteDvd", method = RequestMethod.GET)
    public String deleteDvd(HttpServletRequest request) {
        String dvdTitle = request.getParameter("dvdTitle");
        dao.removeDvd(dvdTitle);

        return "redirect:/Dvd/";
    }

    @RequestMapping(value = "/displayEditDvdForm", method = RequestMethod.GET)
    public String displayEditDvdForm(HttpServletRequest request, Model model) {
        String dvdTitle = request.getParameter("dvdTitle");
        Dvd dvd = dao.getDvd(dvdTitle);
        model.addAttribute("dvd", dvd);

        return "DvdLibrary/editDvd";
    }

    @RequestMapping(value = "/editDvd", method = RequestMethod.POST)
    public String editDvd(@Valid @ModelAttribute("dvd") Dvd dvd,
            BindingResult result) {

        if (result.hasErrors()) {
            return "DvdLibrary/editDvd";
        }
        dao.addDvd(dvd.getDvdTitle(), dvd);

        return "redirect:/Dvd/";
    }

}
