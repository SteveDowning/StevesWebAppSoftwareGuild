<%-- 
    Document   : interestCalculatorResult
    Created on : Jun 21, 2017, 8:34:07 PM
    Author     : stephendowning
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <title>Interest Result</title>
        <style>
                
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
        <div style="text-align: center; font-size: 20px">       
            <h1>Interest Calculator</h1>
            <div style="font-size: 20px;">
                Your initial investment was $${currBalKey}.<br/>
                Your annual interest rate is ${intRateKey}%.<br/>
                The term of your investment is ${termKey} years.<br/><br/>
                <p> 
                    <c:forEach var="year" items="${yearListKey}">
                        <c:out value="Year Number: "/> 
                        <c:out value="${year.yearNumber}"/><br/>
                        <c:out value="Beginning Principal: "/>
                        <c:out value="$${year.begPrincipal}"/><br/>
                        <c:out value="Annual Interest: "/>
                        <c:out value="$${year.annInterest}"/><br/>
                        <c:out value="Year End Balance: "/>
                        <c:out value="$${year.yearEndBal}"/><br/><br/>     
                    </c:forEach>
                </p>
                <a href="${pageContext.request.contextPath}/interest/"
                   class="btn btn-default">Calculate Another Investment</a>
            </div>
    </body>
</html>
