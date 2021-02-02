class UsersController < ApplicationController
  def index
    @users = User.all
  end
# ここより下の各アクションを追加しましょう
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :start, :fin, :allday, :memo))
    if @user.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :users
    else
      render "new"
    end
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start, :fin, :allday, :memo))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "スケジュールを削除しました"
      redirect_to :users 
  end
end
