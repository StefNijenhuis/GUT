class AddProductToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :product, :string
  end
end
