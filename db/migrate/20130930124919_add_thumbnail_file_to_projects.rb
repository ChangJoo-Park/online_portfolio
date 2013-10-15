class AddThumbnailFileToProjects < ActiveRecord::Migration
  def self.up
  	add_attachment :projects, :thumbnail
  end

  def self.down
  	remove_attachment :projects, :thumbnail
  end
end
