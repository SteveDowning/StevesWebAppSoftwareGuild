
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <title>Flooring Result</title>
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
            <h1>Your Flooring Order</h1>
            <div style="font-size: 20px;">
                <p>
                    Your job's length is ${lengthKey} feet<br/>
                    Your job's width is ${widthKey} feet<br/>
                    The total area is ${areaKey} square feet<br/>
                    Your job's cost per square foot is $${costPSFKey}<br/>
                    Your job's duration is ${timeKey} hours<br/>
                </p>

                <p style="padding-bottom: 15px">

                    Labor cost = $${totalLaborKey}<br/>
                    Material cost = $${totalMatCostKey}<br/>
                    Total cost = $${totalCostKey}</br>



                </p>
                <a href="${pageContext.request.contextPath}/flooring/" class="btn btn-default">Calculate another Job</a>
            </div>
        </div>
    </body>
</html>
