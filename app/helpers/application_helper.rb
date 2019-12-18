# frozen_string_literal: true

module ApplicationHelper
  def search_r(user, partner)
    a = Relation.find_by(user_id: user.id, partner_id: partner.id)
    b = Relation.find_by(user_id: partner.id, partner_id: user.id)
    if user == partner
      4
    elsif a.present? && b.present?
      3
    elsif a.blank? && b.present?
      2
    elsif a.present? && b.blank?
      1
    else
      0
    end
  end
end
