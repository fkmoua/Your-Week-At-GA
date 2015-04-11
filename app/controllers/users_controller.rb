class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :username, :email, :password, :photo))

        if @user.save 
            redirect_to users_path
        else
            render :user             #if can't save to database (something goes wrong), show us that new page again.
        end 
    end # end of create method

    def edit
        @user = User.find(params[:id])
    end

    def update
          @user = User.find(params[:id])

        if @user.update_attributes(params.require(:user).permit(:name, :username, :email, :password, :photo))
            redirect_to users_path
        else
            render :user
        end
    end

    def destroy
    end

end