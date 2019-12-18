# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImagesUploader
end
