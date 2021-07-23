class CollectionsController < ApplicationController

    def index 
        if params[:user_id]
            user = User.find(params[:user_id])
            render json: user.collections
        else  
            artwork = Artwork.find(params[:artwork_id])
            render json: artwork.collections
        end
    end

    def create
        collection = Collection.new(collection_params)
        if collection.save
            render json: collection
        else  
            render json: collection.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy
        collection = Collection.find(params[:id])
        render json: collection.destroy
    end

    private 

    def collection_params
        params.require(:collection).permit(:title,:owner_id)
    end
end