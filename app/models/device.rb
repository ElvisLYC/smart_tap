class Device < ApplicationRecord
	belongs_to :subscription
	has_many :tasks
	validates :name, presence: true
end
