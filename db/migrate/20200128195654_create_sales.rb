class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.datetime :fecha
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
