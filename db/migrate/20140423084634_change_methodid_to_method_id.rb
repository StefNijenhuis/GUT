class ChangeMethodidToMethodId < ActiveRecord::Migration
  def change
    change_table :usertests do |t|
      t.rename :methodid, :method_id
  	end
  end
end
