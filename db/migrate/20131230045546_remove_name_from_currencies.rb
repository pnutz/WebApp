class RemoveNameFromCurrencies < ActiveRecord::Migration
  def change
    remove_column :currencies, :name, :string
  end
end
