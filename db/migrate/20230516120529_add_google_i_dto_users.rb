class AddGoogleIDtoUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :google_id, :string
  end
end
