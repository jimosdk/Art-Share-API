# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all

    u1  = User.create!(username:"Pablo")
    u2 = User.create!(username:"Dean")
    u3 = User.create!(username:"Sam")

    a1 = Artwork.create!(artist_id:u1.id,image_url:"pablo image url 1",title:"Pablo's art 1")
    a2 = Artwork.create!(artist_id:u1.id,image_url:"pablo image url 2",title:"Pablo's art 2")
    a3 = Artwork.create!(artist_id:u3.id,image_url:"sam image url 1",title:"Sam's art 1")

    ArtworkShare.create!(viewer_id: u2.id,artwork_id: a1.id)
    ArtworkShare.create!(viewer_id: u3.id,artwork_id: a1.id)
    ArtworkShare.create!(viewer_id: u2.id,artwork_id: a2.id)
    ArtworkShare.create!(viewer_id: u2.id,artwork_id: a3.id)
end