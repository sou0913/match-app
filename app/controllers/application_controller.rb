class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_attributes, unless: :devise_controller?


  def buttonT(user,partner)
    x = searchR(user,partner)
    case x
    when 0
      return {color: "green", text: "いいねを送る", mark: "send", type: 0}
    when 1
      return {color: "pink", text: "いいねしました", mark: "favorite", type: 1}
    when 2
      return {color: "blue", text: "いいねをお返し", mark: "send", type: 2}
    when 3
      return {color: "teal darken-1", text: "メッセージを送る", mark: "send", type: 3}
    end
  end

  helper_method :searchR, :buttonT
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource_or_scope)
      root_path
  end

  def after_sign_out_path_for(resource_or_scope)
      user_session_path
  end

  def check_attributes
    if user_signed_in?
      if current_user.role.blank?
      render "users/first", layout: 'noheader'
      end
    end
  end

end
