class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40

      t.timestamps null: false
    end
  end
end
