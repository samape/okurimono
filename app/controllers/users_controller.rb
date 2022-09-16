class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @prefecture = user.prefecture
    @introduction = user.introduction
    @items = user.items
  end

  def edit
  end

  def update
    current_user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :gender_id, :prefecture_id, :introduction)
  end
end
