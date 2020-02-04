class RemoveNameFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users,  :nombre

    remove_column :users,  :clave
  end
end
