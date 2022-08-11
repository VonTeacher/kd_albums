class Album < ApplicationRecord
  belongs_to :artist, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :artist }
end
