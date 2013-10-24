class Project < ActiveRecord::Base
	has_many :sub_images, dependent: :destroy
	validates :title, presence: true
  # TODO Select sizes
	has_attached_file :thumbnail,
										styles: { medium: "600x600", thumb:"200x150#",
															small: "300x300#",  large: "600x600>"},
										default_url: "http://placehold.it/300x300",
										preserve_files: true
end 