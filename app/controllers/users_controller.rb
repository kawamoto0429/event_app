class UsersController < ApplicationController
  def home
    if logged_in?
      @user = User.find(session[:user_id])
    end
  end
  def show
    if logged_in?
      @user = User.find(@current_user.id)
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
   @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:success] = "更新しました!"
        redirect_to user_path(@user)
    else
         
        render 'edit'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :body)
    end
    
    def body_params
      params.require(:user).permit(:body)
    end
end
