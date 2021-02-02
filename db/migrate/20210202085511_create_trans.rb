class CreateTrans < ActiveRecord::Migration[6.0]
  def change
    create_table :trans do |t|

      t.timestamps
    end
  end
end
