class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:commentable_id])
        @comment = @post.comments.build(commenter_id: current_user.id, body: params[:body])

        if @comment.save
            redirect_to post_url(@post)
        else
            redirect_to post_url(@post)
        end
    end

    def destroy
        post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to post_url(post)
    end
end
