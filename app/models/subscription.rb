class Subscription < ApplicationRecord
	has_many :devices

  def self.purchase_range
    (1..50)
  end

  def price
  	@price = '1000'
  end

	def paid
		self.update(payment_verification: true)
	end
end
