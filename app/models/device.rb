class Device < ApplicationRecord


	has_many :consumptions, dependent: :destroy
  belongs_to :user
	belongs_to :subscription
	has_many :tasks
	validates :name, presence: true

end
