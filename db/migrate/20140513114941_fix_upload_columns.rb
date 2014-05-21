class FixUploadColumns < ActiveRecord::Migration
  def change
  	remove_column :uploads, :path, :string
  	remove_column :uploads, :type, :string
  end
end
