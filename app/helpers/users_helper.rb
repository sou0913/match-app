# frozen_string_literal: true

module UsersHelper

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
end
