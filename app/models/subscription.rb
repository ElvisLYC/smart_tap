class Subscription < ApplicationRecord
	belongs_to :user
	has_many :devices
	before_create :set_balance_unit

	def self.purchase_range
    (0..1)
  end

	def set_balance_unit
		self.balance_unit = self.purchase_unit
	end

  def price
  	@price = '1000'
  end

	def paid
		self.update(payment_verification: true)
	end
end
