class RemoveDataFromItems < ActiveRecord::Migration[6.0]
  def change

    remove_column :items,  :reservation_id

    remove_column :items,  :sale_id
  end
end
