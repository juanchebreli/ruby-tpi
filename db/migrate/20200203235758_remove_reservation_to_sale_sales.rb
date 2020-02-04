class RemoveReservationToSaleSales < ActiveRecord::Migration[6.0]
  def change
    remove_column :sales , :reservation_id
  end
end
