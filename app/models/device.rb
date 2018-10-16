class Device < ApplicationRecord


	has_many :consumptions, dependent: :destroy
  belongs_to :user
	has_many :tasks
	validates :name, presence: true

end
