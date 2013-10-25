class Project < ActiveRecord::Base
	has_many :sub_images, dependent: :destroy
	acts_as_list
	validates :title, presence: true
end 