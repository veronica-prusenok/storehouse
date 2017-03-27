module Products
  class ManageController < ApplicationController
    def index
      @products = Product.all
    end
  end
end
