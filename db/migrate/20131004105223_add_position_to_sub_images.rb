class AddPositionToSubImages < ActiveRecord::Migration
  def change
    add_column :sub_images, :position, :integer
  end
end
