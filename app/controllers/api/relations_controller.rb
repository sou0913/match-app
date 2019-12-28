class Api::RelationsController < ApplicationController
  include ApplicationHelper

  def index
    partner_id = params[:id].to_i
    partner = User.find(partner_id)
    Relation.create(user_id:current_user.id, partner_id:partner_id)
    Redis.current.sadd("f-#{current_user.id}", partner_id)
    Redis.current.sadd("b-#{partner_id}", current_user.id)
    render json: {key: "value"}
  end
end
