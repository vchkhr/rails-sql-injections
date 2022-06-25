class ArticlesController < ApplicationController
  def index
  end

  def delete_all
    @users = User.all
    @user = @users.first
  end

  def from
  end
end
