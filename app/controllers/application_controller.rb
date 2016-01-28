class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def require_permission
    unless current_user.admin?
      flash[:alert] = "You do not have permission to view this page"
      redirect_to root_path
    end
  end

end
