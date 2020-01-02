class AddAudioTouUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :audio, :string
  end
end
