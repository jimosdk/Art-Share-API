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
end
