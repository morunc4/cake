class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  enum payment_method: {credit_card:0,transfer:1}
  
  with_options presence: true do
    validates :delivery_name
    validates :delivery_postal_code
    validates :delivery_address
  end
end
