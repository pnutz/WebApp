class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :street_address
      t.string :zipcode
      t.references :city

      t.timestamps
    end
  end
end
