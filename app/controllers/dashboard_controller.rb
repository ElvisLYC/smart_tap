require 'fusioncharts-rails'
class DashboardController < ApplicationController

	def index
		# @consumption = Consumption.first
		@graph
		@graph_w
		@graph_m
		@graph_l
	end
end
