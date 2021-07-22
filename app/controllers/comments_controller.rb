class CommentsController < ApplicationController

    def index 
        if comment_params
            comments = Comment.where(comment_params)
            render json: comments
        else
            render plain: 'You need to specify a user or an artwork'
        end
    end

    def liked_comments
        liker = User.find(params[:user_id])
        render json: liker.liked_comments
    end

    def create 
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        render json: comment.destroy
    end

    private
    
    def comment_params
        params.require(:comment).permit(:commenter_id,:artwork_id,:body)
        # if params[:comment].keys.include?('commenter_id')
        #     params.require(:comment).permit(:commenter_id)
        # elsif params[:comment].keys.include?('artwork_id')
        #     params.require(:comment).permit(:artwork_id)    
        # end      
    end
end