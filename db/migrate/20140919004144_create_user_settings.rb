class CreateUserSettings < ActiveRecord::Migration
  def change
    create_table :user_settings do |t|
      t.references :user, index: true
      t.references :currency, index: true

      t.timestamps
    end
  end
end
