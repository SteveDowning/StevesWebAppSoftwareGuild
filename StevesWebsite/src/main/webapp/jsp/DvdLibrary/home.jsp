

<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

    <head>
        <title>DVD Library </title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

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
            th {
                text-align: center;
            }
            td {
                text-align:center;
                margin-right: 50px;
            }
            #homeAnchor{
                margin-bottom:-100px; 
                margin-left:50px;
            }

        </style>
    </head>

    <body>
        
        <div class="container-fluid">
            <a href="${pageContext.request.contextPath}/" class="btn btn-default" id="homeAnchor">Home</a>

            <div class="row" style="text-align:center">
                <h1 style="padding-bottom: 20px">Welcome to the DVD Library</h1>
                <div class="col-md-3">
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/Dvd/displayCreateDvdPage" class="btn btn-default">
                            Create Dvd
                        </a>

                    </div>
                </div>
                <form class="form-inline" action="${pageContext.request.contextPath}/Dvd/searchDvds" method="POST">

                    <div class="col-md-3"> 
                        <h4>Key word (Title) search</h4>
                        <div id="errorMessageDiv">${errorMessage}</div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group" >
                            <input type="text" class="form-control" name="searchTerm" placeholder="Search Term">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <button type="submit" name="searchButton" class="btn btn-default">Search</button>
                        </div>
                    </div>

                </form>

            </div>
            <ul class="list-group" id="errorMessages"></ul>
            <div class="row col-md-12">
                <div id="dvdTableDiv">
                    <table id="dvdTable" class="table table-hover">
                        <tr>
                            <th width="25%">Title</th>
                            <th width="25%">Release Year</th>
                            <th width="18%">Director</th>
                            <th width="18%">Rating</th>
                            <th width="7%"></th>
                            <th width="7%"></th>

                        </tr>
                        <c:forEach var="currentDvd" items="${dvdList}"> 

                            <tr>
                                <td>
                                    <a href="displayDvdDetails?DvdTitle=${currentDvd.dvdTitle}">
                                        <c:out value="${currentDvd.dvdTitle}"/>
                                    </a>
                                </td>  
                                <td>
                                    <c:out value="${currentDvd.releaseDate}"/>
                                </td>
                                <td>
                                    <c:out value="${currentDvd.directorsName}"/>
                                </td>
                                <td>
                                    <c:out value="${currentDvd.mpaaRating}"/>
                                </td>
                                <td>
                                    <a href="displayEditDvdForm?dvdTitle=${currentDvd.dvdTitle}">
                                        Edit</a>
                                </td>
                                <td>
                                    <a href="deleteDvd?dvdTitle=${currentDvd.dvdTitle}">
                                        Delete</a>
                                </td>

                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>




        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/DvdLibraryHome.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>

</html>