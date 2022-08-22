class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.boolean :accepted, default: false
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.references :seller_card, null: false, foreign_key: { to_table: :offers }
      t.references :buyer_card, null: false, foreign_key: { to_table: :offers }

      t.timestamps
    end
  end
end
