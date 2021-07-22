class LikesController < ApplicationController

    def index
        likes = Like.where(like_params)
        render json: likes
    end

    def create
        like = Like.new(like_params)
        if like.save  
            render json: like
        else  
            render json: like.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy
        like = Like.find(params[:id])
        render json: like.destroy
    end

    private

    def like_params
        params.require(:like).permit(:liker_id,:likeable_type,:likeable_id)
    end
end