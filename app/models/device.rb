class Device < ApplicationRecord
	belongs_to :subscription, dependent: :destroy
	has_many :consumptions, dependent: :destroy
end
