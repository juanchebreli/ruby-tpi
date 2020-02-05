class AddClientToPhone < ActiveRecord::Migration[6.0]
  def change
    add_reference :phones, :client, null: false, foreign_key: true
  end
end
