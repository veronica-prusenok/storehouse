class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def after_invite_path_for(inviter, invitee)
    users_manage_index_path
  end
end
