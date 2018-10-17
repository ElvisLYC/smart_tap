// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require tether
//= require bootstrap
//= require mdb
//= require jquery

//= require fusioncharts/fusioncharts
//= require fusioncharts/fusioncharts.charts
//= require fusioncharts/themes/fusioncharts.theme.fusion
//= require fusioncharts/themes/fusioncharts.theme.fint

  url = "http://192.168.1.215/"
  time = setInterval(myTimer, 3000);

  function myTimer() {

      state();
      console.log(window.location.href)
      if (window.location.href != "http://localhost:3000/"){
        myStopFunction()
      }



FusionCharts.ready(function() {

  var stockPriceChart = new FusionCharts({
      id: "stockRealTimeChart",
      type: 'realtimeline',
      renderAt: 'chart-container',
      width: '700',
      height: '400',
      dataFormat: 'json',
      dataSource: {
        "chart": {
          "caption": "Real-time consumption monitor",
          "subCaption": "Bob house",
          "xAxisName": "Time",
          "yAxisName": "Consumption unit",
          "numberPrefix": "kwh",
          "refreshinterval": "3",
          "yaxisminvalue": "0",
          "yaxismaxvalue": "100",
          "numdisplaysets": "10",
          "labeldisplay": "rotate",
          "showRealTimeValue": "0",
          "theme": "fusion"
        },
        "categories": [{
          "category": [{
            "label": "Day Start"
          }]
        }],
        "dataset": [{
          "data": [{
            "value": "0"
          }]
        }]
      },
      "events": {
        "initialized": function(e) {
          function addLeadingZero(num) {
            return (num <= 9) ? ("0" + num) : num;
          }

          function updateData() {
            // Get reference to the chart using its ID
            var chartRef = FusionCharts("stockRealTimeChart"),
              // We need to create a querystring format incremental update, containing
              // label in hh:mm:ss format
              // and a value (random).
              currDate = new Date(),
              label = addLeadingZero(currDate.getHours()) + ":" +
              addLeadingZero(currDate.getMinutes()) + ":" +
              addLeadingZero(currDate.getSeconds()),
              // Get random number between 35.25 & 35.75 - rounded to 2 decimal places
              // randomValue = Math.floor(Math.random() *
              //   50),

              randomValue = (Date.parse(new Date())-Date.parse("2018-10-16T17:59"))/1000,

              // Build Data String in format &label=...&value=...
              strData = "&label=" + label +
              "&value=" +
              randomValue;
            // Feed it to chart.
            chartRef.feedData(strData);

            console.log(randomValue)
          }

          var myVar = setInterval(function() {
            updateData();
          }, 3000);
        }
      }

    if (window.location.href == "http://localhost:3002/"){
    state();
    }else{
      myStopFunction()
    }

  }

  function myStopFunction() {
      clearInterval(time);
  }

  function state(){
    fetch(url, {
    // fetch('https://8fdf0043.ngrok.io/18/on', {
    // headers: {'Access-Control-Allow-Origin': 'http://192.168.1.215' }
    }).then(function(response){
      return response.json()
    }).then(function(data){
      console.log(data)
      lightState = data;
      if (lightState == 1){
      document.querySelector('#img-light').src = '/assets/power-btn-on.png';
    }else if (lightState == 0){
      document.querySelector('#img-light').src = '/assets/power-btn-off.png';
    }
    })
  }

  function toggleLight(e){
    if (lightState == 1){
      url2 = url+'18/off'
      lightState = 0
      document.querySelector('#img-light').src = '/assets/power-btn-off.png';
    }else if (lightState == 0){
      url2 = url+'18/on'
      lightState = 1
      document.querySelector('#img-light').src = '/assets/power-btn-on.png';
    }
    fetch(url2, {
    // fetch('https://8fdf0043.ngrok.io/18/on', {
      // headers: {'Access-Control-Allow-Origin': 'http://192.168.1.215' }
    }).then(function(response){
      return response.json()
    }).then(function(data){
      console.log(data)
    })
  }


  function schedule(e){
    // url = "http://192.168.1.215/1/*/*/*/*/*"
    url3 = url+'1/*/*/*/*/*'
     // e.preventDefault()
    fetch(url3, {
    // fetch('https://8fdf0043.ngrok.io/18/on', {
      // headers: {'Access-Control-Allow-Origin': 'http://192.168.1.215' }
    }).then(function(response){
      return response.json()
    }).then(function(data){
      console.log(data)

    })
  }
