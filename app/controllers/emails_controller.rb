class EmailsController < ApplicationController
    
    def create
        @emails = Email.new(validateParam)
        if @emails.save
            redirect_to emails_path(id: @emails.id)
        end
    end

    def new
        @emails = Email.new
    end

    def index 
        if (params[:id]).nil?
            redirect_to root_path
        else
            @emails = Email.find(params[:id])
        end
    end

    private
        def validateParam
            params.permit(:subject,:body,:scheduled_time,:send_to)
        end
end
