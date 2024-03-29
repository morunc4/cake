class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_item=CartItem.where(customer_id: current_customer.id)
    @total=0
  end
  
  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      @cart_item=CartItem.where(customer_id: current_customer.id)
      @total=0
      render :index
      
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    CartItem.where(customer_id: current_customer.id).destroy_all
    redirect_to cart_items_path
  end
  
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount,:customer_id,:item_id)
  end
end
