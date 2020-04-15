class UsersController < ApplicationController
    skip_before_action :authorize_user
    skip_before_action :verify_authenticity_token
    
    def index 
        users = User.all
        render json: users
    end 

    def create
        @user = User.create(user_params)
        if @user.save
            sessions[:user_id] = @user.id
            redirect_to controller: 'sessions', action: 'new'
        else 
            # flash[:errors] = "Cannot create user"
            redirect_to controller: 'users', action: 'new'
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
