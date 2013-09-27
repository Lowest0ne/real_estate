class CreateTennants < ActiveRecord::Migration
  def change
    create_table :tennants do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :building_id, null: false

      t.timestamps
    end
  end
end
