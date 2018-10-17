class ConsumptionsController < ApplicationController

	def create
		# when the light is on create a new power data
		# if the device and user id is the same it will take the data instead of creating a new data
		# and will just update the data when close

		@consumption = Consumption.new
		@consumption.power = 0
		@consumption.save
	end

	def update
		# when the light is off the power data is updated to the consumption table
		@consumption = Consumption.find(params[:power])
		@consumption.update(params[:power])

	end

end


# @consumption = Consumption.new
# 		@consumption.power = "0"
# 		@volt = @consumption.power

# 		if (light_state == 1) do 
# 			volt += 1
# 			break if (light_state == 0)
# 		end

# 		elsif @consumption.update
			

# 		else @consumption.save



