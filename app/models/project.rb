class Project < ActiveRecord::Base
	has_many :sub_images, dependent: :destroy
	acts_as_list
	validates :title, presence: true
	validates :title, length: { minimum: 5 }

	has_attached_file :thumbnail,
										styles: { medium: "600x600", thumb:"200x150#",
															small: "300x300#",  large: "600x600>"},
										default_url: "http://placehold.it/100x100",
										preserve_files: true
end 