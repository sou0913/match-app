module UsersHelper
  include ApplicationHelper

  def select_image(user) 
    if user.image?
      return user.image.url
    else
      return "no_image.png"
    end
  end
  
  def select_profile(user)
    if user.profile.present?
      return user.profile
    else
      return "よろしくお願いします"
    end
  end

  def button_data(user, partner, relation)
    case searchR(user, partner)
      when 0
        return {text: "いいねを送る", color: "green", mark: "send", partner: partner, relation: relation, type: 0 }
      when 1
        return {text: "いいねしました", color: "pink", mark: "favorite", partner: partner, relation: relation, type: 1 }
      when 2
        return {text: "いいねをお返し", color: "blue", mark: "send", partner: partner, relation: relation, type: 2 }
      when 3 
        return {text: "メッセージを送る", color: "teal darken-1", mark: "send", partner: partner, relation: relation, type: 3 }
      when 4
        return {text: "プロフィールを編集", color:"green", mark:"send", partner: partner, relation: relation, type: 4 }
    end
  end
  
end
