
class UsersController < ApplicationController
    skip_before_action :authorize_user
    skip_before_action :verify_authenticity_token
    

    def sign_in
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        render json: { email: user.email, token: generate_token(id: user.id) }
      else
        render json: { error: "Username or Password is invalid "}
      end
    end
  
    def validate
      if get_user
        render json: { email: get_user.email, token: generate_token(id: get_user.id)}
      else
        render json: { error: "You are not authorized" }
      end
    end

    def chats
        if get_user
          render json: { chats: get_user.chats }
          byebug
        else
          render json: { error: "You are not authorized" }
        end
    end
  
    def index 
        users = User.all
        render json: users
    end 

    def create
        @user = User.create(user_params)
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
