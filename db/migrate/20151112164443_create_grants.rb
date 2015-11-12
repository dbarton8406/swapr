class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.integer :user_id, null: false
      t.integer :wish_id, null: false
      t.attachment :gift
      t.integer :download_count, default: 0
      t.text :details

      t.timestamps null: false
    end
  end
end
