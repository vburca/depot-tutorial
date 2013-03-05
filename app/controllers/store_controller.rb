class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    increment_views
    @index_count = index_views
  end
end
