class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @prefecture = user.prefecture
    @introduction = user.introduction
  end
end
