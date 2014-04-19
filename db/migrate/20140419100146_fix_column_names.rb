class FixColumnNames < ActiveRecord::Migration
  def change
    change_table :usertests do |t|
      t.rename :userid, :user_id
  	end
  end
end
