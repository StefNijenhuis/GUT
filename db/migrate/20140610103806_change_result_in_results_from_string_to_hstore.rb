class ChangeResultInResultsFromStringToHstore < ActiveRecord::Migration
  def change
    change_table :results do |t|
      t.remove :result
      t.hstore :result
  	end
  end
end
