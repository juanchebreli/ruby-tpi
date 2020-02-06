class RemoveNumeroToPhone < ActiveRecord::Migration[6.0]
  def change
    remove_column :phones , :numero
  end
end
