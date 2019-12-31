class Api::UsersController < ApplicationController
  def index
    email = params[:email]
    same_user = User.find_by(email: email)
    if !same_user.nil?
      render json: { result: 'no' }
    else
      render json: { result: 'yes' }
    end
  end
end
