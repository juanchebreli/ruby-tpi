class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :precio
      t.references :product, null: false, foreign_key: true
      t.string :estado

      t.timestamps
    end
  end
end
