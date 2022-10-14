class PostsController < ApplicationController

    def index
        @posts = Post.where(user_id: current_user.id)
        friends = current_user.friends

        if friends
            friends.each do |friend|
                @posts << Post.where(user_id: friend.users_friend_id)
            end
        end
    end

    def create
        @post = current_user.posts.new
        @post.body = params[:body]

        if @post.save
            redirect_to action: :index
        end
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
    
        if @post.update(post_params)
            redirect_to action: :index
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments.all
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to action: :index
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :body)
    end
  
end
