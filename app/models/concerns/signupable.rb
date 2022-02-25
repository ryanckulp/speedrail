module Signupable
  extend ActiveSupport::Concern

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  validates :email, uniqueness: { case_sensitive: false }, presence: true
end
