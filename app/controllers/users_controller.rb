class UsersController < ApplicationController
  def index
    @users=User.all
    @user = User.new
  end
  def show
    @user=User.find(params[:id])
    @books = @user.books 
  end
  def create
    @user= User.new(user_params)


  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  def top
  
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
