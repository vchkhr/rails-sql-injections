class ArticlesController < ApplicationController
  def index
  end

  def delete_all
    @users = User.all
    @user = @users.first
  end

  def find_by
    @users = User.all
    @user = @users.first
    @user_last = @users.last
  end
end
