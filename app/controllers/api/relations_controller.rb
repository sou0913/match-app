class Api::RelationsController < ApplicationController
  include ApplicationHelper

  def index
    partner_id = params[:id].to_i
    partner = User.find(partner_id)
    case search_r(current_user, partner)
    when 0
      Relation.create(user_id:current_user.id, partner_id:partner_id)
      render json: {key: "value"}
    when 2
      Relation.create(user_id:current_user.id, partner_id:partner_id)
      render json: {key: "value"}
    when 3
      render json: {key: "value"}
    when 4
      render json: {key: "value"}
    end
  end
end
