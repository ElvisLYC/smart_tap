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


//= require jquery

//= require fusioncharts/fusioncharts
//= require fusioncharts/fusioncharts.charts
//= require fusioncharts/themes/fusioncharts.theme.fusion
//= require fusioncharts/themes/fusioncharts.theme.fint



function myFunction() {
  let current_selection = document.getElementById("subscription_purchase_unit")
  let total_price = current_selection.value * 1000
  document.getElementById("total_sum").innerHTML = "Total Price is RM" + total_price;
}


// FusionCharts.ready(function() {
//   var stockPriceChart = new FusionCharts({
//       id: "stockRealTimeChart",
//       type: 'realtimeline',
//       renderAt: 'chart-container',
//       width: '700',
//       height: '400',
//       dataFormat: 'json',
//       dataSource: {
//         "chart": {
//           "caption": "Real-time stock price monitor",
//           "subCaption": "Harry's SuperMart",
//           "xAxisName": "Time",
//           "yAxisName": "Stock Price",
//           "numberPrefix": "$",
//           "refreshinterval": "5",
//           "yaxisminvalue": "35",
//           "yaxismaxvalue": "36",
//           "numdisplaysets": "10",
//           "labeldisplay": "rotate",
//           "showRealTimeValue": "0",
//           "theme": "fusion"
//         },
//         "categories": [{
//           "category": [{
//             "label": "Day Start"
//           }]
//         }],
//         "dataset": [{
//           "data": [{
//             "value": "35.27"
//           }]
//         }]
//       },
//       "events": {
//         "initialized": function(e) {
//           function addLeadingZero(num) {
//             return (num <= 9) ? ("0" + num) : num;
//           }

//           function updateData() {
//             // Get reference to the chart using its ID
//             var chartRef = FusionCharts("stockRealTimeChart"),
//               // We need to create a querystring format incremental update, containing
//               // label in hh:mm:ss format
//               // and a value (random).
//               currDate = new Date(),
//               label = addLeadingZero(currDate.getHours()) + ":" +
//               addLeadingZero(currDate.getMinutes()) + ":" +
//               addLeadingZero(currDate.getSeconds()),
//               // Get random number between 35.25 & 35.75 - rounded to 2 decimal places
//               randomValue = Math.floor(Math.random() *
//                 50) / 100 + 35.25,
//               // Build Data String in format &label=...&value=...
//               strData = "&label=" + label +
//               "&value=" +
//               randomValue;
//             // Feed it to chart.
//             chartRef.feedData(strData);
//           }

//           var myVar = setInterval(function() {
//             updateData();
//           }, 5000);
//         }
//       }
//     })
//     .render();
// });
