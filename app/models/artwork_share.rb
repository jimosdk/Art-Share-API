# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  favorite   :boolean          default(FALSE), not null
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
# Indexes
#
#  index_artwork_shares_on_artwork_id_and_viewer_id  (artwork_id,viewer_id) UNIQUE
#  index_artwork_shares_on_viewer_id                 (viewer_id)
#
class ArtworkShare < ApplicationRecord
    validates :favorite,presence: true
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
