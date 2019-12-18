# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_attributes, unless: :devise_controller?

  def button_t(user, partner)
    x = search_r(user, partner)
    case x
    when 0
      { color: 'green', text: 'いいねを送る', mark: 'send', type: 0 }
    when 1
      { color: 'pink', text: 'いいねしました', mark: 'favorite', type: 1 }
    when 2
      { color: 'blue', text: 'いいねをお返し', mark: 'send', type: 2 }
    when 3
      { color: 'teal darken-1', text: 'メッセージを送る', mark: 'send', type: 3 }
    end
  end

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
