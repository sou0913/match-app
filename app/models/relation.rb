# frozen_string_literal: true

class Relation < ApplicationRecord
  belongs_to :favor_user, class_name: "User"
  belongs_to :favored_user, class_name: "User"
end
