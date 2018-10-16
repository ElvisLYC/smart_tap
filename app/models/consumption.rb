class Consumption < ApplicationRecord
	belongs_to :devices
	belongs_to :users

end
