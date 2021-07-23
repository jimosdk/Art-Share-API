# == Schema Information
#
# Table name: saved_artworks
#
#  id            :bigint           not null, primary key
#  artwork_id    :integer          not null
#  collection_id :integer          not null
#
# Indexes
#
#  index_saved_artworks_on_artwork_id                    (artwork_id)
#  index_saved_artworks_on_collection_id_and_artwork_id  (collection_id,artwork_id) UNIQUE
#
class SavedArtwork < ApplicationRecord
    validates :collection_id,uniqueness: {scope: :artwork_id}
    validate :viewable_artwork

    belongs_to :artwork 

    belongs_to :collection 

    has_one :collection_owner,
        through: :collection,
        source: :owner

    def viewable_artwork
        errors.add(:base,"Owner of collection doesn't have access to this artwork") unless viewable?
    end

    def viewable?
        user = collection_owner
        subquery1 = Artwork.joins(:artist).where(id:artwork_id,users: {id: user.id})
        subquery2 = ArtworkShare.joins(:viewer).where(artwork_id: artwork_id,users: {id: user.id})
        User.where(id: user.id).where('EXISTS(?) OR EXISTS(?)',subquery1,subquery2).exists?
    end
end
