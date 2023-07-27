class CreateAdmin < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :first_name

      t.timestamps
    end
  end
end
