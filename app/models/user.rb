class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: [:slugged, :history]
  has_many :projects, dependent: :destroy
  #include Authority::UserAbilities
  #  has_many :projects, foreign_key: :id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  # after_save { self.add_role(:standard) unless self.has_any_role? }

  validates_uniqueness_of :username
  validates_presence_of :username
  validates_presence_of :email

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:username)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
  end

  def should_generate_new_friendly_id?
    new_record?
  end
end
