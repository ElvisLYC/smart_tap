class Task < ApplicationRecord
  after_save :update_crontab
  after_initialize :end_time
  validates :name, presence: true

	def turn_on
		puts "model, light on"
	end

  def get_time
    # min_start = min_start ? start_time.strftime("%M") : "nil"
    time_start = start_time ? start_time.strftime("%H:%M:%S") : "nil"
    time_end = end_time ? end_time.strftime("%H:%M:%S") : "nil"
    {end_time: time_end, start_time: time_start}
  end

  def get_device_id
    x = Device.find_by(name: self.name).id
    self.update(device_id: x)
  end

  private
  def update_crontab
    `cd #{Rails.root} && RAILS_ENV=#{Rails.env} bundle exec whenever --update-crontab`
  end
end
