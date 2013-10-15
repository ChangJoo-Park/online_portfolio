class AddRemoveThumbnailToProjects < ActiveRecord::Migration
  def change
    #add_column :projects, :remove_thumbnail, :boolean
    remove_column :projects, :remove_thumbnail
  end
end
