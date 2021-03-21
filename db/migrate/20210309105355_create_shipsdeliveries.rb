class CreateShipsdeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :shipsdeliveries do |t|
      t.string :postnumber,     null: false
      t.string :shiparea_id,     null: false
      t.string :deliverymunicipality,     null: false
      t.string :deliveryaddres,     null: false
      t.string :builname
      t.string :phonenumber,     null: false
      t.references :buyer, foreign_key: true
      t.timestamps
    end
  end
end
