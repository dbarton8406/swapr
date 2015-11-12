class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.integer :user_id, null: false
      t.string :media_type, null: false
      t.boolean :fulfilled, default: false
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
