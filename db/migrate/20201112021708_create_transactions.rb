class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string     :postal_code, null: false
      t.integer    :add_pref_id, null: false
      t.string     :add_muni,    null: false
      t.string     :add_local,   null: false
      t.string     :add_house
      t.string     :phone_num,   null: false
      t.references :order,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
