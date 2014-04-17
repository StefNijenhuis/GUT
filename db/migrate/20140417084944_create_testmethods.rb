class CreateTestmethods < ActiveRecord::Migration
  def change
    create_table :testmethods do |t|
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
end
