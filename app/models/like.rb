# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string           not null
#  likeable_id   :integer          not null
#  liker_id      :integer          not null
#
# Indexes
#
#  index_likes_on_likeable_type_and_likeable_id               (likeable_type,likeable_id)
#  index_likes_on_liker_id_and_likeable_type_and_likeable_id  (liker_id,likeable_type,likeable_id) UNIQUE
#
class Like < ApplicationRecord
    validates :liker_id, uniqueness: { scope: [:likeable_type,:likeable_id]}

    belongs_to :liker,
        class_name: :User

    belongs_to :likeable,
        polymorphic: true
end
