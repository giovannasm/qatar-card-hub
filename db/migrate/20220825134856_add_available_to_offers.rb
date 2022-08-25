class AddAvailableToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :available, :boolean, default: true, null: false
  end
end
