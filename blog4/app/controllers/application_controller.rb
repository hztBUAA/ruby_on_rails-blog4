class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #为了让user另外加上新添加的属性

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,:email,:password,:description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name,:email,:password,:description])
  end
end
