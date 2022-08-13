# frozen_string_literal: true

# mutation {
#   createAlbum(input:
#     {
#       title:"Title",
#       artist:"Artist",
#       user:"Vaughn"
#   	}
#   ) {
#     album {
#       id
#       title
#       artist
#       user
#     }
#   }
# }


class Mutations::CreateAlbum < Mutations::BaseMutation
  argument :title, String, required: true
  argument :artist, String, required: true
  argument :user, String, required: true

  field :album, Types::AlbumType, null: false
  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(title:, artist:, user:)
    album = Album.new(
      title: title,
      artist: Artist.find_by(name: artist),
      user: User.find_by(name: user)
    )

    if album.save
      { album: album, errors: [] }
    else
      { album: nil, errors: album.errors.full_messages }
    end
  end
end
