class AddPriceToSaleItem < ActiveRecord::Migration[6.0]
  def change
    add_column :sale_items, :price, :integer
  end
end
