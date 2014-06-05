class RenameMethodnameToMethodid < ActiveRecord::Migration
  def change
    change_table :usertests do |t|
      t.rename :methodname, :method_id
  	end
  end
end
