module ApplicationHelper
  
  def searchR(user, partner)
    a = Relation.find_by(user_id: user.id, partner_id: partner.id)
    b = Relation.find_by(user_id: partner.id, partner_id: user.id)
    if user == partner
      return 4
    elsif a.present? && b.present?
      return 3
    elsif a.blank? && b.present?
      return 2
    elsif a.present? && b.blank?
      return 1
    else 
      return 0
    end
  end

end
