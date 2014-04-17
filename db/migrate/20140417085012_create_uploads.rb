class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :path
      t.string :type

      t.timestamps
    end
  end
end
