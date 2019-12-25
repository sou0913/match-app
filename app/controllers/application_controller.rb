# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_attributes, unless: :devise_controller?

  helper_method :search_r, :button_t

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(_resource_or_scope)
    root_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    user_session_path
  end

  def check_attributes
    return unless user_signed_in?

    render 'users/first', layout: 'noheader' if current_user.role.blank?
  end
end
