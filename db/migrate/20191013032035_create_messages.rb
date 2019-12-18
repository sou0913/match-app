class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text          :content
      t.string        :message
      t.references    :user,          foreign_key: true
      t.integer       :partner_id,    null: false
      t.timestamps
    end
  end
end
