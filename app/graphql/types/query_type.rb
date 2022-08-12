module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Get all artists
    field :artists, [Types::ArtistType], null: false

    def artists
      Artist.all
    end

    # Get a specific artist by name
    field :artist, Types::ArtistType, null: false do
      argument :name, String, required: true
    end

    def artist(name:)
      Artist.includes(:albums).find_by(name: name)
    end

    # Get all albums
    field :albums, [Types::AlbumType], null: false

    def albums
      Album.all
    end

    # Get a specific album by name
    field :album, Types::AlbumType, null: false do
      argument :title, String, required: true
    end

    def album(title:)
      Album.find_by(title: title)
    end
  end
end
