class AddPaymentVerificationToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :payment_verification, :boolean, default: false
  end
end
