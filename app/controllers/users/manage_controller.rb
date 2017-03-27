module Users
  class ManageController < ApplicationController
    def index
      @resources = User.all
    end
  end
end
