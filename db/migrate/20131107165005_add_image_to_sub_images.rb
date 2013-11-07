class AddImageToSubImages < ActiveRecord::Migration
  def change
    add_column :sub_images, :image, :string
  end
end
