class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,     null: false
      t.text :description, null:false
      t.integer :category_id, null:false
      t.integer :condition_id, null:false
      t.string :price, null:false
      t.integer :delively_payer_id, null:false
      t.integer :ship_area_id, null:false
      t.integer :ship_day_id, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
