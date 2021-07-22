# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  favorite  :boolean          default(FALSE), not null
#  image_url :string           not null
#  title     :string           not null
#  artist_id :integer          not null
#
# Indexes
#
#  index_artworks_on_artist_id_and_title  (artist_id,title) UNIQUE
#
class Artwork < ApplicationRecord
    validates :title,:image_url,:favorite,presence: true
    validates :artist_id,uniqueness: { scope: :title}

    belongs_to :artist,
        class_name: :User

    has_many :artwork_shares,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        dependent: :destroy

    has_many :commenters,
        through: :comments,
        source: :commenter

    has_many :likes,
        as: :likeable,
        dependent: :destroy

    has_many :likers,
        through: :likes,
        source: :liker
end
