<!doctype html>
<html>

    <head>
        <title>Weather Map API </title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <style>
            #homeAnchor{
                margin-bottom:-100px; 
                margin-left:50px;
                background-color:cornflowerblue;
            }
            html,
            body,
            .container-fluid {
                background-image: url("https://www.planwallpaper.com/static/images/background-wallpapers-32_NRz0mTd.jpg");  
                height: 100%;
            }
            h1,h2,h3,h4{
                color:white;
                font-family: Arial;
            }
            label{
                color:white;
                font-family: Arial;
                font-size: 25px;
            }

            ul{
                color:white;
                font-size: 20px;
            }

        </style>
    </head>

    <body>
        <div class="container">
            <a href="${pageContext.request.contextPath}/" class="btn btn-default" id="homeAnchor">Home</a>
            <div style="text-align:center">
                <h1 >Weather Page</h1>
                <h3>Enter your zip code to find the current weather in your area!</h3>
            </div>
            <hr/>
            <div class="row" >
                <form class="form-inline">

                    <div class="form-group col-md-6" style="text-align:center;">
                        <label for="zipcode">Zipcode:</label>
                        <input type="text" class="form-control" id="zipcode" placeholder="Enter Zipcode">
                    </div>

                    <div class="form-group col-md-6">
                        <label for="units">Units:</label>
                        <select type="text" class="form-control" id="units">
                            <option>imperial</option>
                            <option>metric</option>          
                        </select>
                        <button type="button" id="weatherButton" class="btn btn-default">Get Weather</button>
                    </div>


                </form>
                <hr>
            </div>

            <div id="currentConditionsDiv">
                <div class="row">
                    <div class="col-md-12">
                        <h2 id="conditionsHeader" class="content"></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <h3 id="condition" class="content"> </h3>
                    </div>
                    <div class="col-md-4">
                        <ul style="list-style: none">
                            <li id="temp" class="content"></li> 
                            <li id="humidity" class="content"></li>
                            <li id="wind" class="content"></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2>Five Day Forecast</h2>
                    </div>
                </div>

                <div class="row" style="text-align: center">

                    <div class="col-md-2">
                        <ul style="list-style: none">
                            <li id="col1Item1" class="content"></li> 
                            <li id="col1Item2" class="content"></li>
                            <li id="col1Item3" class="content"></li>
                        </ul>
                    </div>
                    <div class="col-md-2">
                        <ul style="list-style: none">
                            <li id="col2Item1" class="content"></li> 
                            <li id="col2Item2" class="content"></li>
                            <li id="col2Item3" class="content"></li>
                        </ul>
                    </div>
                    <div class="col-md-2">
                        <ul style="list-style: none">
                            <li id="col3Item1" class="content"></li> 
                            <li id="col3Item2" class="content"></li>
                            <li id="col3Item3" class="content"></li>
                        </ul>
                    </div>
                    <div class="col-md-2">
                        <ul style="list-style: none">
                            <li id="col4Item1" class="content"></li> 
                            <li id="col4Item2" class="content"></li>
                            <li id="col4Item3" class="content"></li>
                        </ul>
                    </div>
                    <div class="col-md-2">
                        <ul style="list-style: none">
                            <li id="col5Item1" class="content"></li> 
                            <li id="col5Item2" class="content"></li>
                            <li id="col5Item3" class="content"></li>
                        </ul>
                    </div>

                </div>



            </div>
        </div>

        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/weatherMap.js"></script>
    </body>

</html>