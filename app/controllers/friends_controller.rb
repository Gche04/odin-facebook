class FriendsController < ApplicationController
    def index
        @friends = Friend.where(user_id: current_user.id)
    end
    
    def create
        @friend = Friend.new(users_friend_id: params[:users_friend_id])
        @friend.user_id = current_user.id

        if @friend.save
            f = FriendRequest.find(params[:req_id])
            f.destroy
            redirect_to :action => "index", :controller => "friend_requests"
        end
    end

    def show
        @friends = Friend.where(user_id: params[:id]).or(Friend.where(users_friend_id: params[:id]))
    end

    def destroy
        @friend = Friend.find(params[:id])
        @friend.destroy
        redirect_to action: :index
    end

    private

    def users_friends
        user_friends = []
        friends = Friend.where(user_id: params[:id]).or(Friend.where(users_friend_id: params[:id]))

            friends.each do |friend|
                if friend.user_id == current_user.id
                    user_friends << friend.user_friends
                else
                    user_friends << friend.user
                end
            end
        user_friends
    end
end
