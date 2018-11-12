# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
  u1 = User.create(username: "eric")
  u2 = User.create(username: "julian")
  u3 = User.create(username: "emma")
  u4 = User.create(username: "sue")
  u5 = User.create(username: "ryan")
 
Artwork.destroy_all
  a1 = Artwork.create(title: "My masterpiece", image_url: 'http://www.image.com', artist_id: u1.id)
  a2 = Artwork.create(title: "My masterpiece 2", image_url: 'http://www.image2.com', artist_id: u1.id)
  a3 = Artwork.create(title: "My masterpiece 3", image_url: 'http://www.image3.com', artist_id: u1.id)
  a4 = Artwork.create(title: "Picasso cover", image_url: 'http://www.picasso.com', artist_id: u2.id)
  a5 = Artwork.create(title: "Picasso cover 2", image_url: 'http://www.picasso2.com', artist_id: u2.id)
  
ArtworkShare.destroy_all
  as1 = ArtworkShare.create(artwork_id: a1.id, viewer_id: u5.id)
  as2 = ArtworkShare.create(artwork_id: a1.id, viewer_id: u4.id)
  as3 = ArtworkShare.create(artwork_id: a4.id, viewer_id: u3.id)
  as4 = ArtworkShare.create(artwork_id: a3.id, viewer_id: u3.id)
  as5 = ArtworkShare.create(artwork_id: a2.id, viewer_id: u2.id)
  

