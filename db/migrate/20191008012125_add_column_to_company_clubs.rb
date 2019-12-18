# frozen_string_literal: true

class AddColumnToCompanyClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :company_clubs, :match, :integer
  end
end
