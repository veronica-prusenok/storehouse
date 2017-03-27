module Users
  class ManageController < ApplicationController
    def index
      @resources = User.not_admins
    end
  end
end
