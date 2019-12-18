class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.references :user, foreign_key: true
      t.integer    :partner, null: false
      t.integer    :relationship, default: 0
    end
  end
end
