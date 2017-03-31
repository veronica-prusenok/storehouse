class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_filter :authenticate_user!, only: [:index, :search]

  protected

  def after_invite_path_for(inviter, invitee)
    users_manage_index_path
  end

  def authenticate_inviter!
    authenticate_user!(:force => true)
    authorize_admin!
  end

  private

  def authorize_admin!
    redirect_to root_path unless current_user.admin?
  end

end
