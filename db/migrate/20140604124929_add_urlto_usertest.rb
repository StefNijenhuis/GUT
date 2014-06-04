class AddUrltoUsertest < ActiveRecord::Migration
  def change
    add_column :usertests, :url, :string
  end
end
