class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    
    if article.save
      flash[:notice] = 'user created successfully!'
      redirect_to user
    else
      flash.now[:error] = "Error: #{user.errors.full_messages}"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to user
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id]).destroy

    redirect_to root_path
  end

  private
  def article_params
    params.require(:user).permit(:name)
  end

end
