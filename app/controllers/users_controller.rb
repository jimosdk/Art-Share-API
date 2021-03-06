class UsersController < ApplicationController
    def index 
        if params[:user].nil?
            render json: User.all
        else
            username = "%#{params[:user][:username]}%"
            render json: User.where('LOWER(username) LIKE LOWER(?)',username)
        end
    end

    def artwork_likers
        artwork = Artwork.find(params[:artwork_id])
        render json: artwork.likers
    end

    def comment_likers
        comment = Comment.find(params[:comment_id])
        render json: comment.likers
    end

    def create
        # render json:params
        user = User.new(user_params)
        if user.save
            render json: user#,notice: "User's #{user.name} info has been saved"
        else  
            render json: user.errors.full_messages,status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        unless User.exists?(params[:id])
            render plain: "User doesn\'t exist" 
            return
        end
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy
        unless User.exists?(params[:id])
            render plain: "User doesn\'t exist" 
            return
        end
        user = User.find(params[:id])
        if user.destroy
            render json: user
        else
            render json: user.errors.full_messages,status: :unprocessable_entity
        end
    end

    protected

    def user_params
        params.require(:user).permit(:username) 
    end
end