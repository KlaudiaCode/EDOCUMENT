class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(usernum: params[:session][:usernum])
        if user && user.authenticate(params[:session][:password])
            if user.active
                session[:user_id] = user.id
                session[:user_num] = user.usernum
                flash[:notice] = "Pomyślnie zalogowano!"
                redirect_to user
            else 
                flash[:warning] = "Twoje konto nie jest jeszcze aktywne. Poproś administatora o aktywację."
                redirect_to root_path
            end
        else
            flash.now[:alert] = "Twój login lub hasło są nieprawidłowe."
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Wylogowano"
        redirect_to root_path
    end

end