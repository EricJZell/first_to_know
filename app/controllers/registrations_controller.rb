class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    unless resource.authorized?
      flash[:alert] = "Invalid Authorization Token"
      redirect_to :back and return
    end
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected
  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:phone_number, :authorization_token, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:phone_number, :email, :password, :password_confirmation, :current_password)
  end
end
