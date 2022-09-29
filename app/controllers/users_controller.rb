class UsersController < ApplicationController
  def index
    @users=User.all
    @user = User.new
  end
  def show
    @user=User.find(params[:id])

  end
  def create
    @user= User.new(user_params)


  end
  def top
  end
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
