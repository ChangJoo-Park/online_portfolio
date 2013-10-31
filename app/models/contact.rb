class Contact < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3}
  validates :email, presence: true
  validates :message, presence: true
end
