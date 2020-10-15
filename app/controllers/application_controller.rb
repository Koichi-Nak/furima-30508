class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name_kan, :last_name_kan, :family_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day])
  end

end
