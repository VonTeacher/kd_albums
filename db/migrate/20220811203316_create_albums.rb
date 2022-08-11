class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums, id: :uuid do |t|
      t.string :title
      t.references :artist, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :albums, :title
  end
end
