class Public::HomesController < ApplicationController
  def top
    @item=Item.limit(4).order(:created_at)
  end

  def about
  end
end
