class Task < ApplicationRecord
  after_save :update_crontab
  
	def turn_on
		puts "model, light on"
	end

  private
  def update_crontab
    `cd #{Rails.root} && RAILS_ENV=#{Rails.env} bundle exec whenever --update-crontab`
  end
end