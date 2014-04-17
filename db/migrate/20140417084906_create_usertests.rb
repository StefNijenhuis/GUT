class CreateUsertests < ActiveRecord::Migration
  def change
    create_table :usertests do |t|
      t.integer :userid
      t.string :title
      t.text :introtext
      t.integer :methodid
      t.datetime :end_date
      t.datetime :start_date
      t.boolean :status

      t.timestamps
    end
  end
end
