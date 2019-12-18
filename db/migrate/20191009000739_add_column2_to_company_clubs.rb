# frozen_string_literal: true

class AddColumn2ToCompanyClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :company_clubs, :fovor, :integer
  end
end
