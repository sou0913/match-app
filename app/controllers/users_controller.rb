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
    Redis.current.sadd("role-#{current_user.role}", current_user.id)
    redirect_to root_path
  end

  def index
    @q = User.ransack(params[:q])
    ary = return_others(current_user)
    @partners = User.includes(:relations).where(id: ary).page(params[:page]).per(10)
  end

  def show
    @partner = User.find(params[:id])
    @button = relation_type(current_user, @partner)
  end

  def edit; end

  def update
    if current_user.email == "test@example.com"
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
    ary = Redis.current.sdiff("f-#{current_user.id}", "b-#{current_user.id}")
    partners = ary.map {|id| User.find(id)}
    @favor = Kaminari.paginate_array(partners).page(params[:page]).per(10)
  end

  def be_favored
    ary = Redis.current.sdiff("b-#{current_user.id}", "f-#{current_user.id}")
    partners = ary.map {|id| User.find(id)}
    @favored = Kaminari.paginate_array(partners).page(params[:page]).per(10)
  end

  def match
    ary = Redis.current.sinter("f-#{current_user.id}", "b-#{current_user.id}")
    partners = ary.map {|id| User.find(id)}
    @match = Kaminari.paginate_array(partners).page(params[:page]).per(10)
  end

  private

  def search_params
      params.require(:q).permit(:address_eq, :division_eq, :people_eq)
  end

  def updateparams
    params.require(:user).permit(:name, :email, :image, :profile, :address, :division, :people).merge(id: current_user.id)
  end

  def typeparams
    provision = params.require(:user).permit(:role)
    provision[:role] = provision[:role].to_i
    provision
  end
  
  def return_others(user)
    if user.role == 0
      ary = Redis.current.sdiff("role-1", "f-#{user.id}", "b-#{user.id}")
    else
      ary = Redis.current.sdiff("role-0", "f-#{user.id}", "b-#{user.id}")
    end
  end

  def relation_type(user,partner)
    favor = Redis.current.sismember("f-#{user.id}",partner.id)
    be_favored = Redis.current.sismember("b-#{user.id}", partner.id)
    if user.id == partner.id
      return "self"
    elsif favor && be_favored 
      return "message"
    elsif !(favor) && be_favored 
      return "reply"
    elsif favor && !(be_favored)
      return "done"
    else
      return "favorite"
    end
  end

  # 今何人にいいねされているかカウント
  def set_badge()
    be_favored = Redis.current.sdiff("b-#{current_user.id}", "f-#{current_user.id}")
    @badge = be_favored.length
  end

end
