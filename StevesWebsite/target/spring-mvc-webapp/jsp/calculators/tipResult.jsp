<%-- 
    Document   : tipResult
    Created on : Jun 21, 2017, 9:40:45 PM
    Author     : stephendowning
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
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
                font-size: 20px;
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
        <h1>Your Tip</h1>
        <div style="text-align: center; font-size:20px">
            Your bill was: $${billKey}<br/>
            Tip percentage: ${percentKey}%<br/>
            Tip = $${tipKey}<br/>
            Total = $${totalKey}<br/><br/>

            <a href="${pageContext.request.contextPath}/tip/" style="font-size: 20px"
               class="btn btn-default">Calculate Another Tip Ya'll!!</a>

        </div>
    </body>
</html>
