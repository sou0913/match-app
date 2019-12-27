# frozen_string_literal: true

class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :set_relation, only: %i[index show favored search]
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
    @users = User.all
    @q = User.ransack(params[:q])
    @partners = if current_user.role == 1
                  User.includes(:relations).where(role: 0).page(params[:page]).per(10)
                else
                  User.includes(:relations).where(role: 1).page(params[:page]).per(10)
                end
  end

  def show
    @partner = User.find(params[:id])
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
    @q = User.search(search_params)
    @partners = @q.result(distinct: true).page(params[:page]).per(10)
    render 'search.js.erb'
  end

  def favored
    @users = User.all
    favored_ary = []
    @users.each do |partner|
      favored_ary.push(partner) if search_r(current_user, partner) == 2
      @favored = Kaminari.paginate_array(favored_ary).page(params[:page]).per(10)
    end
  end

  private

  def set_relation
    @relation = Relation.new
  end

  def search_params
    if current_user.role == 0
      params.require(:q).permit(:address_eq, :division_eq, :people_eq).merge(role_eq: 1)
    else
      params.require(:q).permit(:address_eq, :division_eq, :people_eq).merge(role_eq: 0)
    end
  end

  def updateparams
    params.require(:user).permit(:name, :email, :image, :profile, :address, :division, :people).merge(id: current_user.id)
  end

  def typeparams
    provision = params.require(:user).permit(:role)
    provision[:role] = provision[:role].to_i
    provision
  end
  
end
