# frozen_string_literal: true

class MessagesController < ApplicationController
  def show
    @message = Message.new
    @messages = Message.where('(user_id = ?) OR (user_id = ?)', current_user.id, params[:id]).where('(partner_id = ?) OR (partner_id = ?)', current_user.id, params[:id]).order(created_at: 'ASC')
    @partner = User.find(params[:id])
    render :show, layout: 'nofooter'
  end

  def create
    @message = Message.create(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content, :image, :partner_id).merge(user_id: current_user.id)
  end
end
