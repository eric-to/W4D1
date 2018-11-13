class ArtworksController < ApplicationController
  
  def index
    if params[:user_id]
      artworks = Artwork.where(artist_id: params[:user_id])
      shares = ArtworkShare.where(viewer_id: params[:user_id])
      all = artworks + shares.map { |share| share.artwork }
      render json: all
    else
      render json: Artwork.all
    end
  end
  
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end
  
  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    render json: artwork
  end
  
  def destroy
    artwork = Artwork.find(params[:id])
    artwork.delete
    render json: artwork
  end
  
  private
  
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
  
end