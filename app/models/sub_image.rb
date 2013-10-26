class SubImage < ActiveRecord::Base
  belongs_to :project
  acts_as_list
  mount_uploader :image, ImageUploader

  before_create :default_caption

  def default_caption
  	self.caption ||= File.basename(image.filename,'.*').titleize if image
  end

end
