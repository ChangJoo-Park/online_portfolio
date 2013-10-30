class Project < ActiveRecord::Base
  belongs_to :user
	has_many :sub_images, dependent: :destroy
	acts_as_list
	validates :title, presence: true
  #FIXME will be fixed best_in_place 'nil'
  before_create :owner
  after_initialize :default_values


  private

    def default_values
      self.description ||= 'Input Something..'
      self.url ||= 'Input Something..'
      self.work_for ||= 'Input Something..'
      self.types ||= 'Input Something..'
      self.layouts ||= 'layout1'
    end

    def owner
      self.user_id ||= current_user.id
    end
end
