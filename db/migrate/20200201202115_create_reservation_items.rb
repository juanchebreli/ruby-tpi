class CreateReservationItems < ActiveRecord::Migration[6.0]
  def change
    create_table :reservation_items do |t|
      t.references :items, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
