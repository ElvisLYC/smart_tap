class DevicesController < ApplicationController

  def index
    @device = Device.new
    @devices = Device.where(user_id: current_user.id)
    @total_device = Subscription.where(user_id: current_user.id).sum(:balance_unit)
  end

  def new
    render 'devices/new'
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.user_id = current_user.id
    @all_subs = current_user.subscriptions.order(balance_unit: :desc)
    @top_subs = @all_subs.first
    if @top_subs.balance_unit>0
      @device.subscription_id = @top_subs.id
  		if @device.save
        @balance = @top_subs.balance_unit - 1
        @top_subs.update(balance_unit: @balance) #9
        @balance_unit = Subscription.where(user_id: current_user.id).sum(:balance_unit)
        redirect_to user_devices_path(current_user.id)
  		end
    end
  end

  def add_device

  end


  private
		def device_params
			params.require(:device).permit(:subscription_id, :user_id, :payment_verification, :name)
		end
end
