class ArtworksController < ApplicationController
    def index
        owned_and_shared = []
        user = User.find(params[:user_id])
        owned_and_shared += user.artworks  
        owned_and_shared += user.shared_artworks
        render json: owned_and_shared
    end

    def liked_artworks
        liker = User.find(params[:user_id])
        render json: liker.liked_artworks
    end

    def favorite_artworks
        user = User.find(params[:user_id])
        favorite_artworks = []
        favorite_artworks += user.favorite_own_artworks
        favorite_artworks += user.favorite_shared_artworks
        render json: favorite_artworks
    end

    def show 
        render json: Artwork.find(params[:id])
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else  
            render json: artwork.errors.full_messages,status: :unprocessable_entity 
        end
    end 

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else 
            render json: artwork.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        render json: artwork.destroy
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title,:image_url,:artist_id)
    end
end