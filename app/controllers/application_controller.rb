class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :address, :age, :description, :interested_in, :cooking_level, availability: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :address, :age, :description, :interested_in, :cooking_level, availability: []])
  end
end
