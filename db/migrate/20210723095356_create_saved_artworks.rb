class CreateSavedArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_artworks do |t|
      t.integer :artwork_id,null: false
      t.integer :collection_id,null: false
    end
    add_index :saved_artworks,[:collection_id,:artwork_id],unique: true
    add_index :saved_artworks, :artwork_id
  end
end
