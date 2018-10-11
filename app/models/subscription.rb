class Subscription < ApplicationRecord
	has_many :devices

  def self.purchase_range
    (1..50)
  end
end
