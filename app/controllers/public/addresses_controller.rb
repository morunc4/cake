class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address=Address.new
    @customer=Address.where(customer_id: current_customer.id)
  end
  
  def edit
    @address=Address.find(params[:id])
  end
  
  def create
    @address=Address.new(address_params)
    @address.customer_id=current_customer.id
    @address.save
    redirect_to addresses_path
  end
  
  def destroy
    @address=Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  private
  
  def address_params
    params.require(:address).permit(:postal_code,:name,:address,:cus)
  end
end
