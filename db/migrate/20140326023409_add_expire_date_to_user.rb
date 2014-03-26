class AddExpireDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :expire_date, :datetime, :default => DateTime.new(2000, 1, 1)
  end
end
