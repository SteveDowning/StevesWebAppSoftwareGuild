<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Flooring Calculator</title>
        <!-- Bootstrap core CSS -->
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
                        <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/flooring/">Flooring Calculator</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/factorizor/">Factorizor</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/interest/">Interest Calculator</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/tip/">Tip Calculator</a></li>


                    </ul>    
                </div>
                <h2>Calculate Your Flooring Job!</h2>
                <p>
                    Our crack flooring specialists lay 20 feet of <br/>
                    flooring per hour at a total labor cost of $86.00 an hour.
                </p>
                <hr/>
                <div id="errorMessageDiv" >${errorMessage} ${errorMessage2} ${errorMessage3}</div>
                <form method="POST" action="${pageContext.request.contextPath}/flooring/calculateJob">
                    <p>

                        Length, in feet, of the area to be covered.<br/>
                        <!--"extantInput" returns invalid input to the input window for user review-->
                        <input type="text" name="areaLength" value="${extantInput}"/>
                        </p>
                        <p>
                          Width, in feet, of the area to be covered.<br/>
                            <input type="text" name="areaWidth" value="${extantInput2}"/>
                        </p> 

                        <p>
                            Cost per square foot of the flooring material?<br/> $
                            <input type="text" name="costPSF" value="${extantInput3}" style="text-align:left;"/><br/>
                            <input type="submit" value="Calculate Job!"  id="inputBtn"/>
                            

                        </p>

                    </form>
                </div>
                <!-- Placed at the end of the document so the pages load faster -->
                <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

            </body>
        </html>

