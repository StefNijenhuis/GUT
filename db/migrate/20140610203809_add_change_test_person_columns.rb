class AddChangeTestPersonColumns < ActiveRecord::Migration
  def change
  	add_column :testpeople, :usertest_id, :integer
    add_column :testpeople, :width, :integer
    add_column :testpeople, :height, :integer
    remove_column :testpeople, :resolution
  end
end
