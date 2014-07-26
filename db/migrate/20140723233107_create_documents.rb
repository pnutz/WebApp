class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.boolean :is_snapshot
      t.references :receipt, index: true

      t.timestamps
    end
  end
end
