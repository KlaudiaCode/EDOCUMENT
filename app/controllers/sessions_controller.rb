class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(usernum: params[:session][:usernum])
        if user && user.authenticate(params[:session][:password])
            if user.active
                session[:user_id] = user.id
                session[:user_num] = user.usernum
                flash[:notice] = "Logged in successfully!"
                redirect_to user
            else 
                flash[:warning] = "Your account is not active. Please contact admin."
                redirect_to root_path
            end
        else
            flash.now[:alert] = "There was something wrong with your login details."
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end