class CreateShippingAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_areas do |t|
      t.string  :postal,        null: false
      t.integer :area_id,       null: false
      t.string  :city,          null: false
      t.string  :addres,        null: false
      t.string  :build
      t.string  :call,          null: false
      t.references :record,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
