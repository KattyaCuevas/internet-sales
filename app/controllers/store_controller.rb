class StoreController < ApplicationController
  def index
    @products = Product.order(:title).where('stock > 0')
  end
end
