class WelcomeController < ApplicationController

	def index
		if current_user != nil
			@full_name= current_user.first_name + " " + current_user.last_name
		end
	end
end
