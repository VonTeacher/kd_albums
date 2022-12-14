class Artist < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :albums

  validates :name, presence: true
end
