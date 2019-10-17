class User < ApplicationRecord

  has_many :books, dependent: :destroy

  validates :name,
	     uniqueness: true,
	     length: {in: 2..20},
	     presence: true

  validates :introduction,
	     length: {maximum: 50}

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
