class Album < ApplicationRecord
  belongs_to :artist, dependent: :destroy
end
