class AddInternalIdToAuthorization < ActiveRecord::Migration
  def change
    add_column :authorizations, :internal_id, :bigint
  end
end
