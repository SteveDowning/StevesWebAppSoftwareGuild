<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <style>
            html,
            body,
            .container-fluid {
                background: linear-gradient(skyblue, lightcyan);  
                height: 100%;
            }
            h1{
                color:white;
                padding-top: 25px;
            }
            ul {
                list-style-type: none;
                color:yellow;
                font-size: 25px;
                padding-left: 0px;
            }
            p{
                color:yellow;
                font-size: 30px;
            }
            #nav1 {
                margin-top:150px;
            }
            #nav2 {
                margin-top:250px;
            }
            #nav3 {
                margin-top:350px;
            }
            #nav4 {
                margin-top:450px;
            }
            
            .btn {
                font-size: 20px;
                background-color: cornflowerblue;

        </style>
    </head>
    <body>
        <div class="container">
            <h1>Welcome to Steve Downing's Web Site</h1>
            <hr/>
            <div class="row">
                <div class="col-md-3">
                    <p>Check out some of the apps I made at the Software Guild</p>
                    <ul>
                        <li>Using:</li>
                        <li>Java</li>
                        <li>JavaScript</li>
                        <li>JQuery</li>
                        <li>HTML</li>
                        <li>CSS</li>
                        <li>Bootstrap</li>
                        <li>JSON</li>
                        <li>AJAX</li>
                        <li>SQL</li>
                    </ul>
                </div>
                <div class="container navContainer">
                    <ul class="nav nav-pills">
                        <div class="col-md-2" id="nav1">
                            <li><a href="${pageContext.request.contextPath}/vending/" class="btn btn-default">Vending Machine</a></li>
                        </div>
                        <div class="col-md-2" id="nav2">
                            <li><a href="${pageContext.request.contextPath}/Dvd/" class="btn btn-default">DVD Library</a></li>
                        </div>
                        <div class="col-md-2" id="nav3">
                            <li><a href="${pageContext.request.contextPath}/flooring/"class="btn btn-default">Calculators</a></li>
                        </div>
                        <!--
                        <div class="col-md-2" id="nav4">
                            <li  id="li4"><a href="${pageContext.request.contextPath}/weatherMap/WeatherMapHome.jsp"class="btn btn-default">Weather Map</a></li>
                      </div>
                        -->
                    </ul>
                </div>

            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

