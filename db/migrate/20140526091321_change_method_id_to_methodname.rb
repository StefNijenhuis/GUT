class ChangeMethodIdToMethodname < ActiveRecord::Migration
  def change
      rename_column :usertests, :method_id, :methodname
  end
end
