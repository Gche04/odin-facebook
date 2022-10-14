class LikesController < ApplicationController
    def create
        @post = Post.find(params[:likeable_id])
        @like = @post.likes.build(liker_id: current_user.id)

        if @like.save
            redirect_to :action => "index", :controller => "posts"
        end
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to :action => "index", :controller => "posts"
    end

end
