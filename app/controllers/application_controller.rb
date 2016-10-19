class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #keep the params in edit.
  after_action :set_csrf_cookie

  protect_from_forgery with: :exception
  respond_to :json
  
  def set_csrf_cookie
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def index

  end

  protected


  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :country, :email])
  end

  def after_sign_in_path_for(resource)
  	request.env['omniauth.origin'] || stored_location_for(resource) || user_path(resource)
  end

   def verified_request?
          super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
   end
end
