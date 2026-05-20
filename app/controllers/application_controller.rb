class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      :lastname,
      :phone,
      :property_type
    ])
  end

  def require_admin
    redirect_to root_path, alert: "No tienes permisos" unless current_user&.admin?
  end

  def community_scope(model)
    return model.all if current_user.admin?
    model.where(community_id: current_user.community_ids)
  end
end