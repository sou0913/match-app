# frozen_string_literal: true

module UsersHelper
  include ApplicationHelper

  def select_image(user)
    if user.image?
      user.image.url
    else
      'no_image.png'
    end
  end

  def select_profile(user)
    if user.profile.present?
      user.profile
    else
      'よろしくお願いします'
    end
  end

  def button_data(user, partner, relation)
    case search_r(user, partner)
    when 0
      { text: 'いいねを送る', color: 'green', mark: 'send', partner: partner, relation: relation, type: 0 }
    when 1
      { text: 'いいねしました', color: 'pink', mark: 'favorite', partner: partner, relation: relation, type: 1 }
    when 2
      { text: 'いいねをお返し', color: 'blue', mark: 'send', partner: partner, relation: relation, type: 2 }
    when 3
      { text: 'メッセージを送る', color: 'teal darken-1', mark: 'send', partner: partner, relation: relation, type: 3 }
    when 4
      { text: 'プロフィールを編集', color: 'green', mark: 'send', partner: partner, relation: relation, type: 4 }
    end
  end
end
