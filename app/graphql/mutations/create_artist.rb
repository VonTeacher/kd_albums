# frozen_string_literal: true

# mutation {
#   createArtist(input:
#     {
#     	name:"Name"
#   	}
#   ) {
#     artist {
#       id
#       name
#       slug
#     }
#   }
# }

module Mutations
  class CreateArtist < Mutations::BaseMutation
    argument :name, String, required: true

    field :artist, Types::ArtistType, null: false
    field :errors, [String], null: false

    def resolve(name:)
      artist = Artist.new(name: name)

      if artist.save
        { artist: artist, errors: [] }
      else
        { artist: nil, errors: artist.errors.full_messages }
      end
    end
  end
end
