class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order=Order.new
  end
  
  def confirm
    @order=Order.new(order_params)
    @cart_item=CartItem.where(customer_id: current_customer.id)
    @total=0
    select_address = params[:order][:select_address]
    if select_address == "0"
      @order.delivery_postal_code=current_customer.postal_code
      @order.delivery_address=current_customer.address
      @order.delivery_name=current_customer.first_name+current_customer.last_name
    elsif select_address == "1"
      @address=Address.find(params[:order][:address_id])
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    elsif select_address == "2"
      
    end
    
   
  end
  
  def create
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @item = Item.find(cart_item.item_id)
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = @item.price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    CartItem.where(customer_id: current_customer.id).destroy_all
    redirect_to complete_orders_path
  end
  
  def complete
  end

  def index
    @order=Order.where(customer_id: current_customer.id)
    
    
  end

  def show
    @order=Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:delivery_address,:delivery_name,:delivery_postal_code,:payment_method,:postage,:billing_amount)
  end
end
