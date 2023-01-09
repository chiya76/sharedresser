class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :age_id, :face_type_id, :makeup_type_id, :personal_color_id, :skin_color_id, :skin_type_id])
  end
end
