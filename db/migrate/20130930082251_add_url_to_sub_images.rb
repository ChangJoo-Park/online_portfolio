class AddUrlToSubImages < ActiveRecord::Migration
  def change
    add_column :sub_images, :url, :string
  end
end
