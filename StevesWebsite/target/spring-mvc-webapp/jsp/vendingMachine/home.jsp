<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Vending Machine </title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <style>

            .productBox {
                height: 175px;
                border: 2px solid black;
               
                margin: 20px;
                border-radius: 25px;
                background-color:steelblue;
                -webkit-text-fill-color: black;
            }
            
            .productBox:hover{
                background-color: lightgoldenrodyellow
            }

            .btn {
                margin-bottom: 6px;
                background-color: lightskyblue;
                font-size: 17px;
                border: 1px solid black;
            }

            .buttonsForm {
                padding-top: 20px;
                padding-bottom: 10px;
            }

            #itemDiv {
                padding-bottom: 10px;
            }

            .productBox .price {
                text-align: center;

            }

            .productBox .itemId {
                text-align: left;
                margin-top: -20px;
            }

            .productBox .itemName {
                text-align: center;
                /*padding-bottom: px;*/
                font-size: 25px;
            }

            .productBox .quantity {
                text-align: center;

            }

            .rightSideBox {

                height: 30px;
                width: 125px;
                border: 2px solid black;
                text-align: center;
                border-radius: 25px;
                margin-left: 40px;
                font-size: 20px;

            }

            #messages {
                width: 225px;
                margin-left: 0px;
            }

            .changeBox {

                height: 50px;
                width: 150px;
                border: 2px solid black;
                text-align: center;
                vertical-align: middle;
                font-size: 20px;
                border-radius: 25px;
                margin-left: 45px;

            }

            hr{
                border: 1px solid black;
            }

            #changeButton{
                margin-left: 40px;
            }

            #background {


                /*padding-top: 10px;*/
            }
            html,
            body,

            .container-fluid {
                background: linear-gradient(skyblue, lightcyan);
                height: 100%;
            }
            
        </style>
    </head>

    <body>

        <div class="container" id="background">


            <div class="row">

                <div class="col-md-9 boxDisplay">
                    <div>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-default"
                       style="margin-bottom: -100px;">Home</a>
                  
                    <h1 style="text-align:center;">Vending Machine</h1>
                    <hr/>
                    </div>
                      
                    <c:forEach var="item" items="${itemList}">
                        <a href ="getCurrentItemId?itemId=${item.itemId}">
                            <div class="col-md-3 productBox"><br/><br/>
                                <h4 class="itemId"><c:out value="${item.itemId}"/></h4>
                                <h4 class="itemName"><c:out value="${item.itemName}"/></h4>
                                <h4 class="price">$ <c:out value="${item.itemPrice}"/></h4>
                                <h4 class="quantity">Quantity: <c:out value="${item.itemQuantity}"/></h4>
                            </div>
                        </a>
                            
                    </c:forEach>
                </div>
                <div class="col-md-3 ">

                    <form class="buttonsForm">
                        <h3 style="text-align: center">Total Money In</h3>
                        <div class="col-sm-12 form-group">
                            <div class="rightSideBox" id="cashIn">$${currentMoney} </div>

                        </div>
                        <div class="col-sm-6">
                            <a href="addDollar"><button type="button" class="btn btn-default" id="dollarButton">Add Dollar</button></a>
                        </div>
                        <div>
                            <a href="addQuarter"><button type="button" class="btn btn-default" id="quarterButton">Add Quarter</button></a>
                        </div>
                        <div class="col-sm-6">
                            <a href="addDime">  <button type="button" class="btn btn-default" id="dimeButton">Add Dime</button></a>
                        </div>
                        <div>
                            <a href ="addNickel">  <button type="button" class="btn btn-default" id="nickelButton">Add Nickels</button></a>
                        </div>
                    </form>

                    <form class="buttonsForm">
                        <h3 style="text-align:center">Messages</h3>
                        <div class="col-sm-12 form-group">
                            <div id="messages" class="rightSideBox">${message}</div>
                        </div>
                        <div class="col-sm-12 form group" id="itemDiv">
                            <label for="item">Item: </label>

                            <div id="itemBox" class="rightSideBox">${currentId} </div>
                        </div>
                        <div class="col-sm-12 form-group" id="makePurchase">
                            <a href="purchase"><button type="button" id="makePurchase" class="btn btn-lg btn-default" style="width:100%;">Make Purchase</button></a>
                        </div>

                    </form>

                    <div id="changeDiv" class="col-sm-12" style="padding-top: 50px;">
                        <div class="changeBox" id="chageBox">$${change}</div> <br>
                        <a href="change"><button type="button" id="changeButton" class="btn btn-default" style="width:75%;">Change</button></a>
                    </div>

                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendingMachine.js"></script>
    </body>
</html>


