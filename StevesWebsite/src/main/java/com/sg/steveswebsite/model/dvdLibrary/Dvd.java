/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.steveswebsite.model.dvdLibrary;

import java.time.LocalDate;
import java.util.Objects;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author stephendowning
 */
public class Dvd {
    @NotEmpty(message = "You must supply a value for Title.")
    @Length(max = 30, message = "Title must be no more than 20 characters in length.")
    private String dvdTitle;
    @NotEmpty(message = "You must supply a value for Release Year.")
    @Length(min = 4, max = 4, message = "Release Year be 4 characters in length.")
    private String releaseDate;
    @Length(max = 5, message = "MPAA Rating must be no more than 5 characters in length.")
    private String mpaaRating;
    @NotEmpty(message = "You must supply a value for Director.")
    @Length(max = 50, message = "Director must be no more than 50 characters in length.")
    private String directorsName;
    @NotEmpty(message = "You must supply a value for Studio.")
    @Length(max = 30, message = "Studio must be no more than 30 characters in length.")
    private String studio;
    @Length(max = 30, message = "User Note must be no more than 50 characters in length.")
    private String userNote;

    
//     public Dvd(String dvdTitle) {
//        this.dvdTitle = dvdTitle;
//    }
     
    public String getDvdTitle() {
        return dvdTitle;
    }

    public void setDvdTitle(String dvdTitle) {
        this.dvdTitle = dvdTitle;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getMpaaRating() {
        return mpaaRating;
    }

    public void setMpaaRating(String mpaaRating) {
        this.mpaaRating = mpaaRating;
    }

    public String getDirectorsName() {
        return directorsName;
    }

    public void setDirectorsName(String directorsName) {
        this.directorsName = directorsName;
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        this.studio = studio;
    }

    public String getUserNote() {
        return userNote;
    }

    public void setUserNote(String userNote) {
        this.userNote = userNote;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 43 * hash + Objects.hashCode(this.dvdTitle);
        hash = 43 * hash + Objects.hashCode(this.releaseDate);
        hash = 43 * hash + Objects.hashCode(this.mpaaRating);
        hash = 43 * hash + Objects.hashCode(this.directorsName);
        hash = 43 * hash + Objects.hashCode(this.studio);
        hash = 43 * hash + Objects.hashCode(this.userNote);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Dvd other = (Dvd) obj;
        if (!Objects.equals(this.dvdTitle, other.dvdTitle)) {
            return false;
        }
        if (!Objects.equals(this.mpaaRating, other.mpaaRating)) {
            return false;
        }
        if (!Objects.equals(this.directorsName, other.directorsName)) {
            return false;
        }
        if (!Objects.equals(this.studio, other.studio)) {
            return false;
        }
        if (!Objects.equals(this.userNote, other.userNote)) {
            return false;
        }
        if (!Objects.equals(this.releaseDate, other.releaseDate)) {
            return false;
        }
        return true;
    }
    
    
}
