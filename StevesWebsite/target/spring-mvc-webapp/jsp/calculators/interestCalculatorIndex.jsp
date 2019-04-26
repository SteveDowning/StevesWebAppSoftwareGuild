<%-- 
    Document   : interestCalculatorIndex
    Created on : Jun 21, 2017, 8:33:43 PM
    Author     : stephendowning
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Interest Calculator</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"> 
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
        </style> 
    </head>
    <body>
        <div class="container">
            <h1>Calculators</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/"><span class="glyphicon glyphicon-home"></span></a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/flooring/">Flooring Calculator</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/factorizor/">Factorizor</a></li>
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/interest/">Interest Calculator</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/tip/">Tip Calculator</a></li>
                </ul> 
                <h2>Interest Calculator</h2>
                <hr/>
                <p>
                    Welcome to the interest calculator. We compound your interest quarterly.<br/>
                    Please enter your data below and we'll take care of the rest.
                </p><br/>
                <form method="POST" action="calculateInterest">
                    <div id="errorMessageDiv" >${errorMessage} ${errorMessage2} ${errorMessage3}</div>
                    <p>
                        How much would you like to invest?<br/> $
                        <input type="text" name="currentBal" value="${extantInput}"/>
                                
                    </p>
                    <p>
                        What's the interest rate of this fund?<br/>
                        <input type="text" name="interestRate" value="${extantInput2}"
                               style="text-align:right; width:50px; margin-left:3px;"/>%
                    </p>
                    <p>
                    What's the term, in years, of this investment?<br/>
                    <input type ="text" name="investmentTerm" value="${extantInput3}"/><br/><br/>
                           
                    <input type="submit" value="Calculate Interest!" style="font-size: 30px"/>
                    </p>
                </form>
            </div>
        </div>                                      
    </body>
</html>
