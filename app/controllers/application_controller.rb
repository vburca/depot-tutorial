class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :date_loaded
  
  def date_loaded
    return Time.now
  end

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def index_views
      if session[:counter].nil?
        session[:counter] = 0
      end
      session[:counter]
    end

    def increment_views
      count = index_views + 1
      session[:counter] = count
    end

end
