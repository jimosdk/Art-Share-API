class AddFavoriteToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :favorite, :boolean,null: false,default: false
  end
end
