module Products
  class ManageController < ApplicationController
    before_action :authorize_admin!

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def edit
      @product = Product.find(params[:id])
    end

    def create
      @product = Product.new(product_params)
      @product.count = 0
      if @product.save
        flash[:notice] = t('products.created')
        redirect_to action: :index
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        flash[:notice] = t('products.updted')
        redirect_to action: :index
      else
        render :edit
      end
    end

    private
    def product_params
      params.require(:product).permit(:title, :image)
    end
  end
end
