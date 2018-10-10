class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
    render 'subscriptions/new'
  end
end
