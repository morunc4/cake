class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_details,dependent: :destroy
  has_many :cart_items
  
  def add_tax_price
    (self.price*1.10).round
  end
  
  
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width,height]).processed
  end
end
