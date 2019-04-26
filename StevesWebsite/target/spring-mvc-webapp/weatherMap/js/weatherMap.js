$(document).ready(function () {

    $('#currentConditionsDiv').hide();

    $('#weatherButton').click(function () {

        $('.content').empty();



        var zip = '';
        var value = $('#zipcode').val();
        //see function with regex at bottom of js for zip validation
        if (checkZip(value)) {
            zip = value;

        } else {
            alert('invalid zip');
            return;
        }

        $('#currentConditionsDiv').show();
        var units = $('#units').val();
        var symbol = getSymbol(units);



        $.ajax({

            type: 'GET',
            url: 'http://api.openweathermap.org/data/2.5/weather?zip=' + zip + ',us&units=' + units + '&appid=8e45e21518909b1e6e53750430bd3278',
            success: function (weatherInfo) {
                $('#conditionsHeader').append('Current conditions in ' + weatherInfo.name);
                $('#condition').append(weatherInfo.weather[0].description + "<img src='http://openweathermap.org/img/w/" + weatherInfo.weather[0].icon + ".png'>");
                $('#temp').append('Temperature: ' + weatherInfo.main.temp + symbol);
                $('#humidity').append('Humidity: ' + weatherInfo.main.humidity);
                $('#wind').append('Wind: ' + weatherInfo.wind.speed);
            },

            error: function () {
                alert("Sorry. No connection.");
            }
        });

        $.ajax({
            type: 'GET',
            url: 'http://api.openweathermap.org/data/2.5/forecast/daily?zip=' + zip + ',us&units=' + units + '&appid=8e45e21518909b1e6e53750430bd3278',

            success: function (fiveDay) {
                var currentDate = new Date(fiveDay.list[0].dt * 1000).toUTCString().substring(0, 7);
                var currentDate2 = new Date(fiveDay.list[1].dt * 1000).toUTCString().substring(0, 7);
                var currentDate3 = new Date(fiveDay.list[2].dt * 1000).toUTCString().substring(0, 7);
                var currentDate4 = new Date(fiveDay.list[3].dt * 1000).toUTCString().substring(0, 7);
                var currentDate5 = new Date(fiveDay.list[4].dt * 1000).toUTCString().substring(0, 7);

                $('#col1Item1').append(currentDate);
                $('#col1Item2').append("<img src='http://openweathermap.org/img/w/" + fiveDay.list[0].weather[0].icon + ".png'>");
                $('#col1Item3').append('H ' + fiveDay.list[0].temp.max + symbol + ' L ' + fiveDay.list[0].temp.min + symbol);

                $('#col2Item1').append(currentDate2);
                $('#col2Item2').append("<img src='http://openweathermap.org/img/w/" + fiveDay.list[1].weather[0].icon + ".png'>");
                $('#col2Item3').append('H ' + fiveDay.list[1].temp.max + symbol + ' L ' + fiveDay.list[1].temp.min + symbol);

                $('#col3Item1').append(currentDate3)
                $('#col3Item2').append("<img src='http://openweathermap.org/img/w/" + fiveDay.list[2].weather[0].icon + ".png'>");
                $('#col3Item3').append('H ' + fiveDay.list[2].temp.max + symbol + '  L ' + fiveDay.list[2].temp.min + symbol);

                $('#col4Item1').append(currentDate4)
                $('#col4Item2').append("<img src='http://openweathermap.org/img/w/" + fiveDay.list[3].weather[0].icon + ".png'>");
                $('#col4Item3').append('H ' + fiveDay.list[3].temp.max + symbol + '  L ' + fiveDay.list[3].temp.min + symbol);

                $('#col5Item1').append(currentDate5)
                $('#col5Item2').append("<img src='http://openweathermap.org/img/w/" + fiveDay.list[4].weather[0].icon + ".png'>");
                $('#col5Item3').append('H ' + fiveDay.list[4].temp.max + symbol + '  L ' + fiveDay.list[4].temp.min + symbol);
            },
            error: function () {
                alert("Sorry. No connection.");
            }
        });

    })

})


function run() {

}


function getSymbol(units) {
    if (units == 'imperial') {
        return 'F';
    } else {
        return 'C'
    }
}

function checkZip(value) {
    return (/(^\d{5}$)|(^\d{5}-\d{4}$)/).test(value);

}