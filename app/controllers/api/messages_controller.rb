class Api::MessagesController < ApplicationController
  def index
    partner_id = params[:partner_id]
    @messages = Message.where("id > #{params[:id]}").where("(user_id = ?) OR (user_id = ?)", current_user.id, partner_id).where("(partner_id = ?) OR (partner_id = ?)", current_user.id, partner_id)
  end
end