# frozen_string_literal: true

class RenameFovorColumnToFavor < ActiveRecord::Migration[5.2]
  def change
    rename_column :company_clubs, :fovor, :favor
  end
end
