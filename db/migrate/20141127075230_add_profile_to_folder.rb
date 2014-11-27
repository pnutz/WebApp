class AddProfileToFolder < ActiveRecord::Migration
  def change
    add_reference :folders, :profile, index: true
  end
end
