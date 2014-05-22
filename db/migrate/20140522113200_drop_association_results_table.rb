class DropAssociationResultsTable < ActiveRecord::Migration
  def change
  	drop_table :association_results
  end
end
