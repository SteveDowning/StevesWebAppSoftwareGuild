<%-- 
    Document   : factorizorIndex
    Created on : Jun 21, 2017, 6:25:52 PM
    Author     : stephendowning
--%>

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
                background: linear-gradient(lightgoldenrodyellow, whitesmoke);
                height: 100%;
            }
            #errorMessageDiv{
                font-size: 20px;
                background-color: red;
                width:400px;

            }
            #inputBtn{
                margin-top:15px;
                text-align:center;
                font-size: 30px;
            }

            p{
                font-size:20px;
            }
            input{
                margin-top:15px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>Calculators</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/"><span class="glyphicon glyphicon-home"></span></a></li>
                    <li role="presentation" ><a href="${pageContext.request.contextPath}/flooring/">Flooring Calculator</a></li>
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/factorizor/">Factorizor</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/interest/">Interest Calculator</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/tip/">Tip Calculator</a></li>


                </ul>    
            </div>
            <h2>Factorizor</h2>
            <div id="errorMessageDiv">${errorMessage}</div>
            <hr/>

            <p>Choose a number to factor: </p>
            <form method="POST" action="${pageContext.request.contextPath}/factorizor/factorNumber">
                <input type="text" name="numberToFactor" value="${extantInput}"/><br/>
                <input type="submit" value="Find Factors!!!" id="inputBtn"/>

            </form>
        </div>

    </body>
</html>
