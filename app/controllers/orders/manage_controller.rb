module Orders
  class ManageController < ApplicationController
    def index
      @orders = current_user.orders.all
    end

    def new
      @order = current_user.orders.new
    end

    def create
      @order = current_user.orders.new(order_params)
      @order.token = @order.auth_token
      if @order.save
        flash[:notice] = t('order.created')
        redirect_to root_path
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
