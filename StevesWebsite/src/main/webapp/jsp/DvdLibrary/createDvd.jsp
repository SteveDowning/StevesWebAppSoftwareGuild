<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create DVD</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .btn {
                margin-bottom: 6px;
                background-color: cornflowerblue;
            }
            html,
            body,
            .container-fluid {
                background: linear-gradient(skyblue, lightcyan);
                height: 100%;
                padding-top: 10px;
            }
            h1,
            h2{
                padding-left:100px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
        <h1>Dvd Library</h1>
         <div id="createDvdDiv">
            <h2>Create a DVD</h2>
            <hr/>
            <ul class="list-group" id="createDvdErrorMessages"></ul>
            <sf:form class="form-horizontal" role="form" modelAttribute="dvd" 
                     action="${pageContext.request.contextPath}/Dvd/createDvd" method="POST">

                <div class="form-group">
                    <label for="dvdTitle" class="col-md-2 control-label"> Dvd Title:</label>
                    <div class="col-md-6">
                        <sf:input type="text" class="form-control" id="dvdTitle" 
                                  path="dvdTitle" placeholder="Enter Title"/>
                        <sf:errors path="dvdTitle" cssclass="errors"></sf:errors>
                    </div>
                </div>

                <div class="form-group">
                    <label for="enterReleaseYear" class="col-md-2 control-label">Release Year:</label>
                    <div class="col-md-6">
                        <sf:input type="number" class="form-control" id="enterReleaseYear" 
                                  path="releaseDate" placeholder="Enter Release Year"/>
                        <sf:errors path="releaseDate" cssclass="errors"></sf:errors>
                    </div>
                </div>

                <div class="form-group">
                    <label for="enterDirector" class="col-md-2 control-label">Director:</label>
                    <div class="col-md-6">
                        <sf:input type="text" class="form-control" id="enterDirector"
                               path="directorsName" placeholder="Enter Director"/>
                        <sf:errors path="directorsName" cssclass="errors"></sf:errors>
                    </div>
                </div>
                <div class="form-group">
                    <label for="enterStudio" class="col-md-2 control-label">Studio:</label>
                    <div class="col-md-6">
                        <sf:input type="text" class="form-control" id="enterStudio" 
                             path="studio" placeholder="Enter Studio"/>
                        <sf:errors path="studio" cssclass="errors"></sf:errors>
                    </div>
                </div>

                <div class="form-group">
                    <label for="rating" class="col-md-2 control-label">Rating:</label>
                    <div class="col-md-1">
                    <sf:select type="text" class="form-control" id="enterRating" path="mpaaRating">
                            <option>G</option>
                            <option>PG</option>
                            <option>R</option>
                            <option>X</option>
                        </sf:select>
                            <sf:errors path="mpaaRating" cssclass="errors"></sf:errors>
                    </div>
                </div>

                <div class="form-group">
                    <label for="note" class="col-md-2 control-label"> Notes:</label>
                    <div class="col-md-6">
                        <sf:input type="text" class="form-control " id="enterNote"
                                  path="userNote" placeholder="Enter Note"/>
                        <sf:errors path="userNote" cssclass="errors"></sf:errors>
                    </div>
                </div>

                <div class="form-group ">
                    <div class="col-md-offset-2">
                        <a href="${pageContext.request.contextPath}/Dvd/" class="btn btn-default">
                        Cancel
                        </a>
                        <button type="submit" id="createButton" class="btn btn-default">Create Dvd</button>
                    </div>
                </div>

            </sf:form>


        </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
