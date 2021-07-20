class ArtworkShare < ApplicationRecord
    validates :artwork_id,uniqueness: {scope: :viewer_id}
    validate :not_own_artwork_share
    
    belongs_to :viewer,
        class_name: :User

    belongs_to :artwork

    def not_own_artwork_share
        errors.add(:viewer_id,"is the owner of the artwork") if own_artwork?
    end

    private 

    def own_artwork?
        User.find(viewer_id).artworks.where(id: artwork_id).exists?
    end
end