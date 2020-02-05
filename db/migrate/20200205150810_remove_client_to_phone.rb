class RemoveClientToPhone < ActiveRecord::Migration[6.0]
  def change
    remove_column :phones , :client_id
  end
end
