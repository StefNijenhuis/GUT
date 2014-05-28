class AddProductToUsertests < ActiveRecord::Migration
  def change
    add_column :usertests, :product, :string
  end
end
