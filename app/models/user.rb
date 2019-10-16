class User < ApplicationRecord

  has_many :books, dependent: :destroy

  validates :name,uniqueness: true
  #validates :name,:email, presence: true

  attachment :profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_required?
	  false
  end
  def email_changed?
	  false
  end

end
