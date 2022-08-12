# frozen_string_literal: true

module Types
  class AlbumType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :artist_id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :slug, String
    # custom fields
    field :artist, String
    field :artist_slug, String

    def artist
      object.artist.name
    end

    def artist_slug
      object.artist.slug
    end
  end
end
