class RelationsController < ApplicationController
  include ApplicationHelper
  
  def create
    @relation = Relation.new(relateparams)
    @partner = User.find(params[:partner_id])
    if @relation.save
      @partner_id = params[:partner_id]
      @button = buttonT(current_user, @partner)
    elsif searchR(current_user, @partner) == 3
      redirect_to user_message_path(current_user, @partner)
    else
      redirect_to root_path, alert: "すでにいいねしています"
    end
  end
  private
  def relateparams
    params.permit(:partner_id).merge(user_id: current_user.id)
  end
end
