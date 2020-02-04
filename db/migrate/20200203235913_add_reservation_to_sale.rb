class AddReservationToSale < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :reservation, null: true, foreign_key: true
  end
end
