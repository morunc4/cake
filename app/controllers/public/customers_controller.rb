class Public::CustomersController < ApplicationController
  
  def show
    
  end

  def edit
    @customer=current_customer
  end
  
  def update
    @customer=current_customer
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end
  
  def unsubscribe
  end
  
  def withdraw
    @customer=current_customer
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
    
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,
                                     :address,:telephone_number,:email)
  end
end
