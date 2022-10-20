class AttachmentsController < ApplicationController
    def index
        @attachment = current_user.attachments.all
    end
    
    def new
        @attachment = current_user.attachments.new
    end
    
    def create
        @attachment = current_user.attachments.new(attachment_params)

        if @attachment.save
            redirect_to :action => "index", :controller => "posts"
        end
    end

    def edit
        @attachment = Attachment.find(params[:id])
    end
    
    def update
        @attachment = Attachment.find(params[:id])
    
        if @attachment.update(attachment_params)
            redirect_to :action => "index", :controller => "posts"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @attachment = Attachment.find(params[:id])
    end

    def destroy
        @attachment = Attachment.find(params[:id])
        @attachment.destroy

        redirect_to :action => "index", :controller => "posts"
    end

    private

    def attachment_params
        params.require(:attachment).permit(:user_id, :caption, images: [])
    end
end
