class ApplicationController < ActionController::Base
  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_404

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
    when User
      users_reserves_path
    when Expert
      experts_reserves_path
    when Admin
    end
  end

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
