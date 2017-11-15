class Admin::OrdersController < AdminController

    def index
      @orders = Order.all.order("completed asc")
    end

    def completed
      @order = Order.find(params[:order_id])
      @order.toggle(:completed).save
      redirect_to admin_orders_path
    end

end
