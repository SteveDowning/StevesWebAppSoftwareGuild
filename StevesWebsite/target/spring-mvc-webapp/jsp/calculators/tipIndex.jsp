<%-- 
    Document   : tipIndex
    Created on : Jun 21, 2017, 9:40:27 PM
    Author     : stephendowning
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <title>Tip Calculator</title>
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
    <body><div class="container">
            <h1>Calculators</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/"><span class="glyphicon glyphicon-home"></span></a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/flooring/">Flooring Calculator</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/factorizor/">Factorizor</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/interest/">Interest Calculator</a></li>
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/tip/">Tip Calculator</a></li>
                </ul>    
            </div>


            <div style="font-size:20px">

                <h2>Tip Calculator</h2>
                <hr/>
                <div id="errorMessageDiv" >${errorMessage} ${errorMessage2}</div>
                <p>
                    Take care of your servers now people!<br/><br/> 
                <form method="POST"  action="${pageContext.request.contextPath}/tip/calculateTip">
                    <p>
                        Please enter your bill total:<br/> $ 
                        <input type="text" name="billTotal" value="${extantInput}"/>
                    </p>
                    <p>
                        Enter the percentage you'd like to tip:<br/>
                        <input type="text" name="percentTip" value="${extantInput2}"
                               style="text-align:right; width:50px; margin-left:17px;"/>%<br/><br/>
                        <input type="submit" value="Calculate Tip" style="font-size: 30px"/>

                    </p>
                </form>
                </p>
            </div>
        </div>
    </body>
</html>
