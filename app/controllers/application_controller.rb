class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def load_order
      @order = Order.find_or_initialize_by(id: session[:order_id], status: "unsubmitted")
      if @order.new_record?
        @order.save!
        session[:order_id] = @order.id
      end
  end

  private 
  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
end
