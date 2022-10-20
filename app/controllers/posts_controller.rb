class PostsController < ApplicationController

    def index
        @posts = user_nd_friends_posts
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


    def user_nd_friends_posts
        posts = []
        friends = Friend.where(user_id: current_user.id).or(Friend.where(users_friend_id: current_user.id))
        
        if friends
            friends.each do |friend|
                posts_1 = friend.user.posts
                posts_2 = friend.users_friend.posts
                attachments_1 = friend.user.attachments
                attachments_2 = friend.users_friend.attachments

                posts_1.each do |post|
                    posts << post
                end

                posts_2.each do |post|
                    posts << post
                end

                attachments_1.each do |att|
                    posts << att
                end

                attachments_2.each do |att|
                    posts << att
                end
            end
        end
        posts
    end
  
end
