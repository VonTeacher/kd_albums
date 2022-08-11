class Album < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  belongs_to :artist, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :artist }
end
