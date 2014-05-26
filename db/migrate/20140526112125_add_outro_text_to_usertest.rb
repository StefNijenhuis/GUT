class AddOutroTextToUsertest < ActiveRecord::Migration
  def change
  	add_column :usertests, :outro_text, :text
  end
end
