class User < ApplicationRecord

  has_many :books, dependent: :destroy

  validates :name,uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_required?
	  false
  end
  def email_changed?
	  false
  end

end
