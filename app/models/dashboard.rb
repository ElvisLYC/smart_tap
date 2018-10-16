require 'json'
require 'fusioncharts-rails'

class Dashboard < ApplicationRecord
	after_initialize :graph, :graph_w
	
	def self.graph(consumption)

		@chart = Fusioncharts::Chart.new({
			type: 'line',
			renderAt: 'chart-container',
			width: '700',
			height: '400',
			dataFormat: 'json',
			dataSource: {
			  "chart": {
			    "theme": "fusion",
			    "caption": "Electric consumption usage daily",
			   
			    "xAxisName": "Day",
			    "yAxisName": "Walt",
			    "lineThickness": "2"
			  },
			  "data": [{
			      "label": "Mon",
			      "value": "100"
			    },
			    {
			      "label": "Tue",
			      "value": "200"
			    },
			    {
			      "label": "Wed",
			      "value": "400"
			    },
			    {
			      "label": "Thu",
			      "value": "150"
			    },
			    {
			      "label": "Fri",
			      "value": "139"
			    },
			    {
			      "label": "Sat",
			      "value": "247"
			    },
			    {
			      "label": "Sun",
			      "value": "333"
			    }
			  ],
			  "trendlines": [{
			    "line": [{
			      "startvalue": "300",
			      "color": "#29C3BE",
			      "displayvalue": "Average{br}weekly{br}consumption",
			      "valueOnRight": "1",
			      "thickness": "2"
			    }]
			  }]
			}
		});

		@chart.render();
	end

	def self.graph_w
		@chart_w = Fusioncharts::Chart.new({
			type: 'line',
			renderAt: 'chart-container-weekly',
			width: '700',
			height: '400',
			dataFormat: 'json',
			dataSource: {
			  "chart": {
			    "theme": "fusion",
			    "caption": "Electric consumption weekly",
			   
			    "xAxisName": "Day",
			    "yAxisName": "Walt",
			    "lineThickness": "2"
			  },
			  "data": [{
			      "label": "First Week",
			      "value": "100"
			    },
			    {
			      "label": "Second Week",
			      "value": "200"
			    },
			    {
			      "label": "Third Week",
			      "value": "400"
			    },
			    {
			      "label": "Fourth Week",
			      "value": "150"
			    }
			  ],
			  "trendlines": [{
			    "line": [{
			      "startvalue": "300",
			      "color": "#29C3BE",
			      "displayvalue": "Average{br}weekly{br}consumption",
			      "valueOnRight": "1",
			      "thickness": "2"
			    }]
			  }]
			}
		});

		@chart_w.render();
	end

	def self.graph_m
		@chart_m = Fusioncharts::Chart.new({
			type: 'line',
			renderAt: 'chart-container-monthly',
			width: '1000',
			height: '400',
			dataFormat: 'json',
			dataSource: {
			  "chart": {
			    "theme": "fusion",
			    "caption": "Electric consumption monthly",
			   
			    "xAxisName": "Day",
			    "yAxisName": "Walt",
			    "lineThickness": "2"
			  },
			  "data": [{
			      "label": "January",
			      "value": "100"
			    },
			    {
			      "label": "February",
			      "value": "200"
			    },
			    {
			      "label": "March",
			      "value": "400"
			    },
			    {
			      "label": "April",
			      "value": "150"
			    },
			    {
			      "label": "May",
			      "value": "150"
			    },
			    {
			      "label": "Jun",
			      "value": "150"
			    },
			    {
			      "label": "July",
			      "value": "150"
			    },
			    {
			      "label": "August",
			      "value": "150"
			    },
			    {
			      "label": "September",
			      "value": "150"
			    },
			    {
			      "label": "October",
			      "value": "150"
			    },
			    {
			      "label": "November",
			      "value": "150"
			    },
			    {
			      "label": "December",
			      "value": "150"
			    }
			  ],
			  "trendlines": [{
			    "line": [{
			      "startvalue": "300",
			      "color": "#29C3BE",
			      "displayvalue": "Average{br}weekly{br}consumption",
			      "valueOnRight": "1",
			      "thickness": "2"
			    }]
			  }]
			}
		});

		@chart_m.render();
	end

	# def self.graph_l
	# 	@chart_l = Fusioncharts::Chart.new({
	# 		type: 'line',
	# 		renderAt: 'chartContainer-live',
	# 		width: '1000',
	# 		height: '400',
	# 		dataFormat: 'json',
	# 		dataSource: {
	# 		  "chart": {
	# 		          "caption": "Real-time stock price monitor",
	# 		          "subCaption": "Harry's SuperMart",
	# 		          "xAxisName": "Time",
	# 		          "yAxisName": "Stock Price",
	# 		          "numberPrefix": "$",
	# 		          "refreshinterval": "5",
	# 		          "yaxisminvalue": "35",
	# 		          "yaxismaxvalue": "36",
	# 		          "numdisplaysets": "10",
	# 		          "labeldisplay": "rotate",
	# 		          "showRealTimeValue": "0",
	# 		          "theme": "fusion"
	# 		      },
	# 		      "categories": [
	# 		          {
	# 		              "category": [
	# 		                  {
	# 		                      "label": "Day Start"
	# 		                  }
	# 		              ]
	# 		          }
	# 		      ],
	# 		      "dataset": [
	# 		          {
	# 		              "data": [
	# 		                  {
	# 		                      "value": "35.27"
	# 		                  }
	# 		              ]
	# 		          }
	# 		      ]
	# 		  }
	# 	});

	# 	@chart_l.render();
	# end
end
