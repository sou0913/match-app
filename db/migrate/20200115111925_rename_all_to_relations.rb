class RenameAllToRelations < ActiveRecord::Migration[5.2]
  def change
    rename_column :relations, :user_id, :favor_user_id
    rename_column :relations, :partner_id, :favored_user_id
  end
end
