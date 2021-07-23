class SavedArtworksController < ApplicationController

    def create
        saved_artwork = SavedArtwork.new(saved_artwork_params)
        if saved_artwork.save
            render json: saved_artwork
        else 
            render json: saved_artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        saved_artwork = SavedArtwork.find(params[:id])
        render json: saved_artwork.destroy
    end

    private

    def saved_artwork_params
        params.require(:saved_artwork).permit(:collection_id,:artwork_id)
    end
end