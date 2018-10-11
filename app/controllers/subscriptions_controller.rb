class SubscriptionsController < ApplicationController


	def new
		# @subscription = Subscription.all
		@subscription = Subscription.new
		# render 'subscriptions/new'
	end

	def create
		@subscription = Subscription.new(subscription_params)
		@subscription.user_id = current_user.id
		@price = 1000
		@total_cost = @price * @subscription.purchase_unit
		@subscription.update(price: @total_cost)

		if @subscription.save
			session["subs_id"] = @subscription.id
			redirect_to pay_subs_path
		end

	end


	def show
		@client_token = Braintree::ClientToken.generate
		@subscription = Subscription.find(session["subs_id"])

	end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
		@unit_price= Subscription.find(session["subs_id"]).price.to_i
		@quantity = Subscription.find(session["subs_id"]).purchase_unit
		@total_cost = @unit_price * @quantity
	  result = Braintree::Transaction.sale(
	   :amount => @total_cost.to_s, #this is currently hardcoded

	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )
	  if result.success?
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end
	end

	private
		def subscription_params
			params.require(:subscription).permit(:purchase_unit, :price)
		end
end
