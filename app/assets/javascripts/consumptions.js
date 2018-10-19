// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
function myFunction() {
  let current_selection = document.getElementById("subscription_purchase_unit")
  let total_price = current_selection.value * 1000
  document.getElementById("total_sum").innerHTML = "Total Price is RM" + total_price;
}


FusionCharts.ready(function() {

  var stockPriceChart = new FusionCharts({
      id: "stockRealTimeChart",
      type: 'realtimeline',
      renderAt: 'chart-container-live',
      width: '700',
      height: '400',
      dataFormat: 'json',
      dataSource: {
        "chart": {
          "caption": "Real-time consumption monitor",
          "subCaption": "Bob house",
          "xAxisName": "Time",
          "yAxisName": "Consumption unit",
          "numberPrefix": "W",
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

              randomValue = (Date.parse(new Date())-Date.parse("2018-10-19T11:59"))/10000,

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
         })
         .render();
     });
