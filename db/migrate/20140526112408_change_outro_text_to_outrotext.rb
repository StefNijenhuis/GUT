class ChangeOutroTextToOutrotext < ActiveRecord::Migration
  def change
  	rename_column :usertests, :outro_text, :outrotext
  end
end
