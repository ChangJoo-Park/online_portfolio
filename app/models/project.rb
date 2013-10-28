class Project < ActiveRecord::Base
	has_many :sub_images, dependent: :destroy
	acts_as_list
	validates :title, presence: true
  #FIXME will be fixed best_in_place 'nil'
  after_initialize :default_values


  private

    def default_values
      self.description ||= 'Input Something..'
      self.url ||= 'Input Something..'
      self.work_for ||= 'Input Something..'
      self.types ||= 'Input Something..'
      self.layouts ||= 'layout1'
    end
end
