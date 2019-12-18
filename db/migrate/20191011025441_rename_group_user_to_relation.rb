# frozen_string_literal: true

class RenameGroupUserToRelation < ActiveRecord::Migration[5.2]
  def change
    rename_table :company_clubs, :relations
  end
end
