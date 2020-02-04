class RemoveSaleToSaleItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :sale_items , :sales_id
  end
end
