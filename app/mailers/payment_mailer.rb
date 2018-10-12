class PaymentMailer < ApplicationMailer
  def payment_email(payment, user)
    @payment = payment
    @user = user
    mail(to: user.email, subject: 'Payment Receipt')
  end
end
