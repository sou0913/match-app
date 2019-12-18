class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :set_relation, only: [:index, :show, :favored, :result]
  skip_before_action :check_attributes, only: :type
  
  def first
    if current_user.role.present?
      redirect_to root_path
    end
    render :first, layout: 'noheader'
  end

  def type
    current_user.update(typeparams)
    redirect_to root_path
  end

  def index
    if current_user.role == 1
      @partners = User.where(role: 0).page(params[:page]).per(10)
    else
      @partners = User.where(role: 1).page(params[:page]).per(10)
    end
  end

  def show
    @partner = User.find(params[:id])
  end

  def edit
  end

  def update
    User.update(updateparams)
  end

  def match
    matchRelations = current_user.relations.where(match: 1).page(params[:page]).per(10)
    @users = []
    matchRelations.each do |matchRelation|
      @users.push(matchRelation.company)
    end
  end

  def favored
    @users = User.all
    favoredAry = []
    @users.each do |partner|
      if searchR(current_user, partner) == 2
        favoredAry.push(partner)
      end
    @favored = Kaminari.paginate_array(favoredAry).page(params[:page]).per(10)
    end
  end

  def search  
    @addressAry = [*1..47]
  end

  def result
    address= params[:address] == "noaddress" ? [*(0..47)] : params[:address]
    genre= params[:genre] == "nogenre" ? [*(0..3)] : params[:genre]
    people= params[:people] == "nopeople" ? [*(0..10)] : params[:people]
    terms= {address: address, genre: genre, people: people}
    if current_user.role == 1
      @partners = User.where(terms).where(role: 0).page(params[:page]).per(10)
    else
      @partners = User.where(terms).where(role: 1).page(params[:page]).per(10)
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
    params.require(:user).permit(:name, :email,:image, :profile, :address, :genre, :people).merge(id: params[:id])
  end

  def typeparams
    provision = params.require(:user).permit(:role)
    provision[:role] = provision[:role].to_i
    return provision
  end

end
