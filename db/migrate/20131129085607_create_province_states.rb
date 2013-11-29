class CreateProvinceStates < ActiveRecord::Migration
  def change
    create_table :province_states do |t|
      t.string :name
      t.references :country

      t.timestamps
    end
  end
end
