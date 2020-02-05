class RemovePriceToItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :items , :precio
  end
end
