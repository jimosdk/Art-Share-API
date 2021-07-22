# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :text             not null
#  artwork_id   :integer          not null
#  commenter_id :integer          not null
#
# Indexes
#
#  index_comments_on_artwork_id    (artwork_id)
#  index_comments_on_commenter_id  (commenter_id)
#
class Comment < ApplicationRecord
    validates :body,presence:true

    belongs_to :commenter,
        class_name: :User

    belongs_to :artwork
    
    has_many :likes,
        as: :likeable,
        dependent: :destroy
    
    has_many :likers,
        through: :likes,
        source: :liker
end
