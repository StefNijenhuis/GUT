class ChangeModelName < ActiveRecord::Migration
  def change
  	rename_table :testpeople, :participant
  end
end
