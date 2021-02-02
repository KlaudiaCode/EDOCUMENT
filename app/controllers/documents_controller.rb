class DocumentsController < ApplicationController
    def index
        @documents = Document.all
    end

    def new
        @document = Document.new
    end
    
    def create
        @document = Document.new(doc_params)
        user = User.find(session[:user_id])
        @document.user = user
        if @document.save
            flash[:notice] = "Dokument zapisany"
            redirect_to @document
        else
            flash[:warning] = @document.errors.full_messages
            render :new
        end
    end

    private

    def doc_params
        params.require(:document).permit(:content)
    end

end