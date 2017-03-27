module Users
  class ManageController < ApplicationController
    before_action :authorize_admin!

    def index
      @resources = User.not_admins
    end

  end
end
