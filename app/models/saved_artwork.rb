class SavedArtwork < ApplicationRecord
    validates :collection_id,uniqueness: {scope: :artwork_id}

    belongs_to :artwork 

    belongs_to :collection 
end