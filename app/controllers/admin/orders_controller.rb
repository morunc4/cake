class Admin::OrdersController < ApplicationController
  def index
    @order=Order.all
  end

  def show
    @order=Order.find(params[:id])
  end
end
