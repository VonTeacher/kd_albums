class AddSlugToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :slug, :string
    add_index :albums, :slug, unique: true
  end
end
