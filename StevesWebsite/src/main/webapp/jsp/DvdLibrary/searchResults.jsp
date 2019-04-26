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
        <title>Search Results</title>
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

            h1,
            h2{
                padding-left:100px;
            }
            #homeDiv{
                margin-left:110px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div id="homeDiv">
                <a href="${pageContext.request.contextPath}/Dvd/" class="btn btn-default">
                    Dvd Home
                </a>
                <h1>Search Results</h1>



            </div>
            <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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

                                <c:out value="${currentDvd.dvdTitle}"/>

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
                           

                        </tr>
                    </c:forEach>

                </table>
            </div>


        </div>
    </div>
</body>
</html>
