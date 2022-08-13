class User < ApplicationRecord
  has_secure_password

  has_many :albums

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
