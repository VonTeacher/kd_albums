class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :artists, :name
  end
end
