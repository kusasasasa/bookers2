class UsersController < ApplicationController
  def index
    @users=User.all
    @user = User.new
    @user = current_user.id
  end
  def show
    @user=User.find(params[:id])
    @books = @user.books
  end
  def create
    @user= User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end

  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
       render :edit
    end

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
