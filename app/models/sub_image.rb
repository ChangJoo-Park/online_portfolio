class SubImage < ActiveRecord::Base
  belongs_to :project
  acts_as_list
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x100>",
  																			 :large => "1000x1000>" }
end