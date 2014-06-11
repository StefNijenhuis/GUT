class FixUsertestid < ActiveRecord::Migration
  def change
  	change_table :results do |t|
      t.rename :usertestid, :usertest_id
      t.rename :testpersonid, :testperson_id
  	end
  end
end
