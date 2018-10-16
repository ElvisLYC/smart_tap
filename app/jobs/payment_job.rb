class PaymentJob < ApplicationJob
  queue_as :default

  def perform(payment, user)
    PaymentMailer.payment_email(payment, user).deliver_later # why deliver_later?
  end

end
