module Signupable
  extend ActiveSupport::Concern

  included do
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    # devise :database_authenticatable, :registerable, :recoverable, :rememberable
    # validates :email, uniqueness: { case_sensitive: false }, presence: true
    
    devise :database_authenticatable, :registerable, :recoverable, :rememberable
    validates :email, uniqueness: { case_sensitive: false }, presence: true
  end
end
