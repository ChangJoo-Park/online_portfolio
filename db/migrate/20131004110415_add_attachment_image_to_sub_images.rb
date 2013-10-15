class AddAttachmentImageToSubImages < ActiveRecord::Migration
  def self.up
    change_table :sub_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :sub_images, :image
  end
end
