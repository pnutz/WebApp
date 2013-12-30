class AddCodeToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :code, :string
  end
end
