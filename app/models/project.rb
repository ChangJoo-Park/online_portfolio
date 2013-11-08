class Project < ActiveRecord::Base
  belongs_to :user
	has_many :sub_images, dependent: :destroy
	acts_as_list
	validates :title, presence: true
  #FIXME will be fixed best_in_place 'nil'
  after_initialize :default_values

  private

    def default_values
      self.description ||= nil
      self.url ||= nil
      self.work_for ||= nil
      self.types ||= nil
      self.layouts ||= 'layout1'
      self.visibility ||= true
    end
end
