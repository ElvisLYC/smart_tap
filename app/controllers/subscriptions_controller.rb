class SubscriptionsController < ApplicationController

  def new
    @subscription = Subscription.new
    @price = 1000
    render 'subscriptions/new'
  end

	def show
		@client_token = Braintree::ClientToken.generate
		

	end

end
