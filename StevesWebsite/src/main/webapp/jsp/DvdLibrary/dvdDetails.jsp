<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <title>Dvd Details Page</title>
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
            td{
                padding:5px;
                text-align: left;
                font-size: 20px;
            }

        </style>
    </head>
    <body>
        <div class="container">
        <h1>Dvd Details</h1>
        <div id="displayDvdTable">
            <h2/><c:out value="${dvd.dvdTitle}"/></h2>
            <hr>
            <table id="displayTable">
                <tr class="displayTableData">
                    <td>Year:</td>
                    <td ><c:out value="${dvd.releaseDate}"/></td>
                </tr>
               <tr class="displayTableData">
                    <td>Director:</td>
                    <td><c:out value="${dvd.directorsName}"/></td>
                </tr>
                <tr class="displayTableData">
                    <td>Studio:</td>
                    <td><c:out value="${dvd.studio}"/></td>
                </tr>
                <tr class="displayTableData">
                    <td>Rating:</td>
                    <td><c:out value="${dvd.mpaaRating}"/></td>
                </tr>
                <tr class="displayTableData">
                    <td>Notes:</td>
                    <td><c:out value="${dvd.userNote}"/></td>
                </tr>

            </table>
            <div>
                <a href="${pageContext.request.contextPath}/Dvd/" class="btn btn-default">
                Back
                   </a>
            </div>

        </div>
       </div> 
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        
    </body>
</html>
