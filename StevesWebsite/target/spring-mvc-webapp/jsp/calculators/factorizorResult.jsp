<%-- 
    Document   : factorizorResult
    Created on : Jun 21, 2017, 6:49:11 PM
    Author     : stephendowning
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <title>Factorizor</title>
        <style>
            html,
            body,
            .container-fluid {
                background: linear-gradient(lightsteelblue, whitesmoke);
                height: 100%;
            }
            .btn {
                margin-bottom: 6px;
                background-color: cornflowerblue;
                margin-top:15px;
                text-align:center;
                font-size: 30px;
            }
            h1{
                text-align: center;
                padding-top:50px;
                padding-bottom:25px;
            }
            #homeAnchor{
                font-size: 20px;
                margin-left:70px;
                margin-top:50px;
                margin-bottom: -50px;
            }
        </style>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/" class="btn btn-default" id="homeAnchor">Home</a>
        <div class="container" style="text-align:center;">
            <h1>Factorizor Results</h1>
            <div style="font-size: 20px;">
                <p>
                    You asked to factor ${numberToFactorKey}
                </p>



                <p>Factors are:
                    <c:forEach var="currentFactor" items="${factorsKey}">
                        <c:out value="${currentFactor}"/>
                    </c:forEach>
                </p>
                <p>
                    <c:choose>
                        <c:when test="${isPerfectKey}">
                            <c:out value="The number is perfect."/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="The number is not perfect."/>
                        </c:otherwise>
                    </c:choose>
                </p>

                <p>
                    <c:choose>
                        <c:when test="${isPrimeKey}">
                            <c:out value="The number is prime"/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="The number is not prime."/>
                        </c:otherwise>
                    </c:choose>
                </p>


                <p>
                    <a href="${pageContext.request.contextPath}/factorizor/"
                       class="btn btn-default">Factor Another One!</a>
                </p>
            </div>
        </div>
    </body>
</html>
