# frozen_string_literal: true

class Relation < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { scope: :partner_id }
end
