class AddPhotoandIdtoUpload < ActiveRecord::Migration
  def change
  	add_column :uploads, :usertest_id, :integer
    add_column :uploads, :photo, :string
  end
end
