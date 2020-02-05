class AddPhonesToClient < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :phone, null: true, foreign_key: true
  end
end
