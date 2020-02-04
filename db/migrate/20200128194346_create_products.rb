class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :codigo
      t.string :descripcion
      t.integer :montoU
      t.text :detalle

      t.timestamps
    end
  end
end
