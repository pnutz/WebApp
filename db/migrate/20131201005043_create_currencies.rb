class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name, :unique => true, :null => false

      t.timestamps
    end
  end
end
