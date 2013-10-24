class SubImage < ActiveRecord::Base
  belongs_to :project
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x100>",
  																			 :large => "1000x1000>" }
end