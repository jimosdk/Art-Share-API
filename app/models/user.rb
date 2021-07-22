# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
    validates :username,uniqueness:true,presence:true

    has_many :artworks,
        foreign_key: :artist_id,
        dependent: :destroy

    has_many :artwork_shares,
        foreign_key: :viewer_id,
        dependent: :destroy

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    has_many :comments,
        foreign_key: :commenter_id,
        dependent: :destroy

    has_many :commented_artworks,
        through: :comments,
        source: :artwork

    has_many :likes,
        foreign_key: :liker_id,
        dependent: :destroy

    has_many :liked_artworks,
        through: :likes,
        source: :likeable,
        source_type: :Artwork

    has_many :liked_comments,
        through: :likes,
        source: :likeable,
        source_type: :Comment

    has_many :favorite_own_artworks,
        ->(artwork){where('artworks.favorite':true)},
        foreign_key: :artist_id,
        class_name: :Artwork  
        
end
