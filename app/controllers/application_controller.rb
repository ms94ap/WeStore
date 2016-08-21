class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #keep the params in edit.
  

  protect_from_forgery with: :exception

  protected


  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :country, :email])
  end

  def after_sign_in_path_for(resource)
  	request.env['omniauth.origin'] || stored_location_for(resource) || user_path(resource)
  end
end
