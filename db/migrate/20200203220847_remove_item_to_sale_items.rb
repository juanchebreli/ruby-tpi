class RemoveItemToSaleItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :sale_items , :items_id
  end
end
