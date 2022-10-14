class FriendRequestsController < ApplicationController
    
    def index
        @requests = FriendRequest.where(request_receiver_id: current_user.id)
    end
    
    def create
        @request = FriendRequest.new(request_receiver_id: params[:request_receiver_id])
        @request.request_sender_id = current_user.id

        if @request.save
            redirect_to :action => "index", :controller => "users"
        end
    end

    def destroy
        @request = FriendRequest.find(params[:id])
        @request.destroy
        redirect_to :action => "index", :controller => "users"
    end
end
