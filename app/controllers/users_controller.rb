# frozen_string_literal: true

class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :set_badge, only: %i[index show edit favor be_favored match search]
  skip_before_action :check_attributes, only: :type
  protect_from_forgery except: :search

  def first
    if current_user.role.present?
      redirect_to root_path
    else
      render :first, layout: 'noheader'
    end
  end

  def type
    current_user.update(typeparams)
    redirect_to root_path
  end

  def index
    users = User.all
    non_relation_users = return_others(current_user) 
    @q = User.ransack(params[:q])
    @partners = Kaminari.paginate_array(non_relation_users).page(params[:page]).per(10)
  end

  def show
    @partner = User.find(params[:id])
    @button = relation_type(current_user, @partner)
  end

  def edit; end

  def update
    if current_user.email == 'test@example.com'
      render 'forbid.js.erb'
    else
      current_user.update(updateparams)
    end
  end

  def search
    ary = return_others(current_user)
    @q = User.ransack(search_params)
    @partners = @q.result(distinct: true).where(id: ary).page(params[:page]).per(10)
  end

  def favor
    favor_users = current_user.favor_users
    @favor = favor_users.page(params[:page]).per(10)
  end

  def be_favored
    favored_users = current_user.favored_users
    @favored = favored_users.page(params[:page]).per(10)
  end

  def match
    matchers = current_user.favor_users & current_user.favored_users
    @match = Kaminari.paginate_array(matchers).page(params[:page]).per(10)
  end

  private

  def relation_type(user, partner)
    favor_users = current_user.favor_users
    favored_users = current_user.favored_users
    if user.id == partner.id
      'self'
    elsif favor_users.include?(partner) && favored_users.include?(partner)
      'message'
    elsif favored_users.include?(partner)
      'reply'
    elsif favor_users.include?(partner) 
      'done'
    else
      'favorite'
    end
  end

  def search_params
    params.require(:q).permit(:address_eq, :division_eq, :people_eq)
  end

  def updateparams
    params.require(:user).permit(:name, :email, :image, :profile, :address, :division, :people, :audio).merge(id: current_user.id)
  end

  def typeparams
    provision = params.require(:user).permit(:role)
    provision[:role] = provision[:role].to_i
    provision
  end

  def return_others(user)
    ary = if user.role.zero?
            users = User.where(role: 1)
            favor_users = current_user.favor_users
            favored_users = current_user.favored_users
            users - favor_users - favored_users
          else
            users = User.where(role: 0)
            favor_users = current_user.favor_users
            favored_users = current_user.favored_users
            users - favor_users - favored_users
          end
  end

  # 今何人にいいねされているかカウント
  def set_badge
    be_favored = current_user.favored_users - current_user.favor_users
    @badge = be_favored.length
  end
end
