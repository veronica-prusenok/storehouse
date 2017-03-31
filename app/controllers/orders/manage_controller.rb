module Orders
  class ManageController < ApplicationController
    def index
      @orders = Order.all
    end

    def show
      @orders = current_user.orders.all
    end

    def new
      @order = current_user.orders.new
      @order.order_items.build
    end

    def create
      @order = current_user.orders.new(order_params)
      @order.token = @order.auth_token
      if @order.save
        flash[:notice] = t('orders.created')
        redirect_to orders_manage_index_path
      else
        render :new
      end
    end

    private
    def order_params
      params.require(:order).permit(order_items_attributes: [:id, :_destroy, :product_id, :count, :direction])
    end
  end
end
