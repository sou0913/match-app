class RenameColumnInRelations < ActiveRecord::Migration[5.2]
  def change
    rename_column :relations, :partner, :partner_id
    remove_column :relations, :relationship, :integer
  end
end
