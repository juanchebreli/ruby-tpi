class AddPriceToReservationItem < ActiveRecord::Migration[6.0]
  def change
    add_column :reservation_items, :price, :integer
  end
end
