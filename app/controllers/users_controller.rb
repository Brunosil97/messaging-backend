class UsersController < ApplicationController
    skip_before_action :authorize_user

    # def sign_in #resources route wont work. Will require a new route
    #     user = User.find_by(email: params[:email])
    #     if user && user.authenticate(params[:password])
    #         #log them in
    #         render json: {message: "Success!"}
    #     else
    #         # give authentication error
    #         render json: {message: "Failure"}
    #     end
    # end

    
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
            flash[:errors] = "Cannot create user"
            redirect_to controller: 'users', action: 'new'
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :profileImage)
    end
end
