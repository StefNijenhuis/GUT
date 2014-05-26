class RemoveMethodsFromDatabase < ActiveRecord::Migration
  def change
  	drop_table :testmethods
  end
end
