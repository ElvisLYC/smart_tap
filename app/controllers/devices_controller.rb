class DevicesController < ApplicationController

  def new
    render 'devices/new'
    @device = Device.new
  end

  def add_device

  end

end
