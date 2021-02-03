class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :nickname,           null: false
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :first_name_kana,    null: false
      t.string :last_name_kana,     null: false
      t.date   :birth_day ,         null: false
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false
    end
  end
end
