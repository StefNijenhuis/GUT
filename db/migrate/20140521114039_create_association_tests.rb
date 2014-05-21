class CreateAssociationTests < ActiveRecord::Migration
  def change
    create_table :association_tests do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
