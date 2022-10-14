class FriendsController < ApplicationController
    def index
        @friends = Friend.where(user_id: current_user.id)
    end
    
    def create
        @friend = Friend.new(users_friend_id: params[:users_friend_id])
        @friend.user_id = current_user.id

        if @friend.save
            FriendRequest.find(params[:req_id]).destroy
            redirect_to :action => "index", :controller => "friend_requests"
        end
    end

    def destroy
        @friend = Friend.find(params[:id])
        @friend.destroy
        redirect_to :action => "index", :controller => "friend_requests"
    end
end
