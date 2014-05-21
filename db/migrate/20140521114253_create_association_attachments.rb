class CreateAssociationAttachments < ActiveRecord::Migration
  def change
    create_table :association_attachments do |t|
      t.integer :association_test_id
      t.string :image

      t.timestamps
    end
  end
end
