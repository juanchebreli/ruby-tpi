class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :fecha
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :state

      t.timestamps
    end
  end
end
