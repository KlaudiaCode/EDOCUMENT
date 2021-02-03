class DocumentsController < ApplicationController
    before_action :require_user
    before_action :require_admin, only: :index
    
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

    def show
        @document = Document.find(params[:id])
    end

    def status
        params[:documents].each do |param|
            doc = Document.find(param[0].to_i)
            
            if param[1]['status'] == '1' && doc.status == "pending"
                doc.status = "accepted"
                flash[:notice] = 'Dokumenty zostały poprawnie zaakceptowane.'
            elsif param[1]['status'] == '0' && doc.status == "accepted"
                flash[:warning] = "Nie możesz cofnąć zaakceptowanych wcześniej wniosków!"
            end
            doc.save
        end
        
        redirect_to '/documents'
    end


    private

    def doc_params
        params.require(:document).permit(:content)
    end

end