class RemoveItemToReservationItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservation_items , :items_id
  end
end
