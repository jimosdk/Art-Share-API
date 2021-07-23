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


    #pablo
    u1  = User.create!(username:"Pablo")

    a1 = Artwork.create!(artist_id:u1.id,image_url:"pablo image url 1",title:"Pablo's art 1")
    a2 = Artwork.create!(artist_id:u1.id,image_url:"pablo image url 2",title:"Pablo's art 2")
        
    #dean
    u2 = User.create!(username:"Dean")

    #sam
    u3 = User.create!(username:"Sam")

    a3 = Artwork.create!(artist_id:u3.id,image_url:"sam image url 1",title:"Sam's art 1")

    #nami
    u4 = User.create!(username:"Nami")

    a4 = Artwork.create!(artist_id:u4.id,image_url:"nami image url 1",title:"Nami's art 1")
    a5 = Artwork.create!(artist_id:u4.id,image_url:"nami image url 2",title:"Nami's art 2")
    a6 = Artwork.create!(artist_id:u4.id,image_url:"nami image url 3",title:"Nami's art 3")


    #shared with dean
    ArtworkShare.create!(viewer_id: u2.id,artwork_id: a1.id) #pablo 1
    ArtworkShare.create!(viewer_id: u2.id,artwork_id: a2.id) #pablo 2
    ArtworkShare.create!(viewer_id: u2.id,artwork_id: a3.id) #sam 1

    #shared with sam
    ArtworkShare.create!(viewer_id: u3.id,artwork_id: a1.id) #pablo1

    #shared with nami
    ArtworkShare.create!(viewer_id: u4.id,artwork_id: a2.id) #pablo2
    ArtworkShare.create!(viewer_id: u4.id,artwork_id: a3.id) #sam 1
    
end