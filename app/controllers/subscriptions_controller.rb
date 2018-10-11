class SubscriptionsController < ApplicationController


	def new
		# @subscription = Subscription.all
		@subscription = Subscription.find(params[:id])
		@client_token = Braintree::ClientToken.generate
		# render 'subscriptions/new'
	end

	def create
		@subscription = Subscription.new
		@subscription.user_id = current_user.id
		if @subscription.save
			@price = 1000
			@quantity = @subscription.purchase_unit
			@total = @price*@quantity

			@subscription.update(price: @total)
			redirect_to root_path
		end
		
	end


	def show
	end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => "100.00", #this is currently hardcoded
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

end

