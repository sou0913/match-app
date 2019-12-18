# frozen_string_literal: true

class CreateCompanyClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :company_clubs do |t|
      t.references  :company, foreign_key: true
      t.references  :club,    foreign_key: true
      t.timestamps
    end
  end
end
