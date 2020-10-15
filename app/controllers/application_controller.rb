class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name_kan, :last_name_kan, :first_name_kana, :last_name_kana, :birth_date])
  end

end
