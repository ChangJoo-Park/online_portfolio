class AddThumbnailToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :thumbnail_url, :string
  end
end
