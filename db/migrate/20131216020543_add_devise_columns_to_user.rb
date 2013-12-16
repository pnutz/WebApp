class AddDeviseColumnsToUser < ActiveRecord::Migration
  def self.up
      add_column :users, :authentication_token, :string
  end

  def self.down
    t.remove :authentication_token
  end
end
