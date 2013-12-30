class AddDescriptionToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :description, :string
  end
end
