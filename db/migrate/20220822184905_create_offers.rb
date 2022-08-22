class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.integer :number
      t.string :player_name
      t.string :team
      t.boolean :special
      t.text :description
      t.timestamps
    end
  end
end
