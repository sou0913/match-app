class RemoveRelationsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :relations

  end
end
