class AddNumeroToPhone < ActiveRecord::Migration[6.0]
  def change
    add_column :phones, :numero, :bigint
  end
end
