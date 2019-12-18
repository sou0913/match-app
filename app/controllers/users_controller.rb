# frozen_string_literal: true

class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :set_relation, only: %i[index show favored result]
  before_action :forbid_test_user, only: :update
  skip_before_action :check_attributes, only: :type

  def first
    redirect_to root_path if current_user.role.present?
    render :first, layout: 'noheader'
  end

  def type
    current_user.update(typeparams)
    redirect_to root_path
  end

  def index
    @partners = if current_user.role == 1
                  User.where(role: 0).page(params[:page]).per(10)
                else
                  User.where(role: 1).page(params[:page]).per(10)
                end
  end

  def show
    @partner = User.find(params[:id])
  end

  def edit; end

  def update
    User.update(updateparams)
  end

  def match
    match_relations = current_user.relations.where(match: 1).page(params[:page]).per(10)
    @users = []
    match_relations.each do |match_relation|
      @users.push(match_relation.company)
    end
  end

  def favored
    @users = User.all
    favored_ary = []
    @users.each do |partner|
      favored_ary.push(partner) if search_r(current_user, partner) == 2
      @favored = Kaminari.paginate_array(favored_ary).page(params[:page]).per(10)
    end
  end

  def search; end

  def result
    address = params[:address] == 'noaddress' ? [*(0..47)] : params[:address]
    genre = params[:genre] == 'nogenre' ? [*(0..3)] : params[:genre]
    people = params[:people] == 'nopeople' ? [*(0..10)] : params[:people]
    terms = { address: address, genre: genre, people: people }
    @partners = if current_user.role == 1
                  User.where(terms).where(role: 0).page(params[:page]).per(10)
                else
                  User.where(terms).where(role: 1).page(params[:page]).per(10)
                end
  end

  private

  def set_relation
    @relation = Relation.new
  end

  def searchparams
    params.permit(:address, :genre, :people)
  end

  def updateparams
    params.require(:user).permit(:name, :email, :image, :profile, :address, :genre, :people).merge(id: params[:id])
  end

  def typeparams
    provision = params.require(:user).permit(:role)
    provision[:role] = provision[:role].to_i
    provision
  end
  
  def forbid_test_user
    if current_user.email == "test@example.com"
      flash[:notice] = "テストユーザーのため変更できません"
      redirect_to "/users"
    end
  end
end
