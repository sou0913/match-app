class Api::RelationsController < ApplicationController
  def index
    partner_id = params[:id].to_i
    Relation.create(favor_user_id: current_user.id, favored_user_id: partner_id)
    render json: { key: 'value' }
  end
end
