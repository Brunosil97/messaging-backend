class SessionsController < ApplicationController

    def new 
        # @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to "/home"
        else 
            # flash [:errors] = 'Login error'
            redirect_to(controller: 'sessions', action: 'new')
        end
    end

    def destroy
        session.delete :user_id
        flash[:notice] = "Logged out"

        redirect_to '/', method: :get
    end
end


