class AddDataToSaleItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :sale_items, :sale, null: false, foreign_key: true
    add_reference :sale_items, :item, null: false, foreign_key: true
  end
end
