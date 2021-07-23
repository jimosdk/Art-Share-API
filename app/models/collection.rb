# == Schema Information
#
# Table name: collections
#
#  id       :bigint           not null, primary key
#  title    :string           not null
#  owner_id :integer          not null
#
# Indexes
#
#  index_collections_on_owner_id  (owner_id)
#
class Collection < ApplicationRecord
    validates :title,presence: true

    belongs_to :owner,
        class_name: :User

    has_many :save_instances,
        class_name: :SavedArtwork,
        dependent: :destroy

    has_many :saved_artworks,
        through: :save_instances,
        source: :artwork
end
