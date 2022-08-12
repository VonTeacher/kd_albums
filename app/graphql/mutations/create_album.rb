class Mutations::CreateAlbum < Mutations::BaseMutation
  argument :title, String, required: true
  argument :artist, String, required: true

  field :album, Types::AlbumType, null: false
  field :errors, [String], null: false

  def resolve(title:, artist:)
    album = Album.new(title: title, artist: Artist.find_by(name: artist))

    if album.save
      { album: album, errors: [] }
    else
      { album: nil, errors: album.errors.full_messages }
    end
  end
end
