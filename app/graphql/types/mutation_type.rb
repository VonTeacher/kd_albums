module Types
  class MutationType < Types::BaseObject
    field :create_artist, mutation: Mutations::CreateArtist
    field :create_album, mutation: Mutations::CreateAlbum
  end
end
