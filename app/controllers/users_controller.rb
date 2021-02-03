class UsersController < ApplicationController
    before_action :require_user, except: [:new, :create]
    before_action :require_admin, only: :index
    
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def show
        @user = User.find(params[:id])
        if @user.id != current_user.id
            flash[:notice] = "Illegal action"
            redirect_to root_path
        end
        @documents = Document.all
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to my website! You have successfully signed up." 
            redirect_to users_path
        else 
            render 'new'
        end
    end

    def active
        params[:users].each do |param|
            user = User.find(param[0].to_i)
            if param[1]['active'] == '1' && user.active == false
                user.active = true
            elsif param[1]['active'] == '0' && user.active == true
                user.active = false
            end
            user.save
        end
        flash[:notice] = 'Użytkownicy zaktualizowani'
        redirect_to '/users'
    end

    private
    def user_params
        params.require(:user).permit(:usernum, :email, :password)
    end
end