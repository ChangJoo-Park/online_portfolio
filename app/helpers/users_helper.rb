module UsersHelper
  def project_thumbnail(project)
    # exists thumbnail
    if project.sub_images.exists?
      project.sub_images.order("position ASC").first.image_url(:thumb_user).to_s
    # dont exists thumbnail
    else
      holder_tag("500x300", "No Thumbnail")
    end
  end
end
