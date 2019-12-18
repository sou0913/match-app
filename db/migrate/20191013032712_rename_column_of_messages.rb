# frozen_string_literal: true

class RenameColumnOfMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :message, :image
  end
end
