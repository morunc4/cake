class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer=current_customer
  end
  
  def update
  end
end
