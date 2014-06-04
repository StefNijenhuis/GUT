class AddMethodparamstoUsertest < ActiveRecord::Migration
  def change
    add_column :usertests, :glyphoption1, :string
    add_column :usertests, :glyphoption2, :string
    add_column :usertests, :glyphoption3, :string
  end
end
