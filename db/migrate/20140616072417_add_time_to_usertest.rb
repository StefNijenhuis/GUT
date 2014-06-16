class AddTimeToUsertest < ActiveRecord::Migration
  def change
  		add_column :usertests, :test_time, :integer
  end
end
