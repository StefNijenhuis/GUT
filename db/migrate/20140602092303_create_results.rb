class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :usertestid
      t.integer :testpersonid
      t.string :result
      
      t.timestamps
    end
  end
end
