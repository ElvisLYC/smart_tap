class Subscription < ApplicationRecord
  def self.purchase_range
    (1..50)
  end
end
