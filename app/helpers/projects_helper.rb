module ProjectsHelper

	def thumbnail_link(url, link)
		link_to (image_tag url, size: '140x100'), link
	end

	def thumbnail_remove(project)
		project.thumbnail = nil
		project.save
	end

	def show_thumbnail(project)
		if project.thumbnail?
			project.thumbnail.url
		elsif !project.sub_images.empty?
			project.sub_images.first.url(:thumbnail)
		else
			"http://placehold.it/300x200&text=No thumbnail."
		end
	end

	def before_thumbnail(project)
		project
	end
end
