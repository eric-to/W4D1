# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id,
    message: "artist cannot have two pieces with the same title" }
  validates :title, :artist_id, :image_url, presence: true
  
  belongs_to :user,
    foreign_key: :artist_id,
    class_name: "User"
    
  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: "ArtworkShare"
    
  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
    
  has_many :comments,
    foreign_key: :artwork_id,
    class_name: "Comments"
end
