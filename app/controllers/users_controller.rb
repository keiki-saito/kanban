class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
    if @user != current_user
      redirect_to root_path, alert: '不正なアクセスです。' 
    end
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
       redirect_to root_path,notice: '更新に成功しました'
    else
      render :edit
    end
  end
  
  private #privateでusercontrollerでしか呼び出せなくなる
  def user_params 
    params.require(:user).permit(:name,:email,:profile,:profile_image)
  end
end

