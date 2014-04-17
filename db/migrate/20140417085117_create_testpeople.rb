class CreateTestpeople < ActiveRecord::Migration
  def change
    create_table :testpeople do |t|
      t.string :age
      t.string :name
      t.string :email
      t.string :browser
      t.string :ip
      t.string :os
      t.string :resolution
      t.boolean :gender
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
