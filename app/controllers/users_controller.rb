class UsersController < ApplicationController
  def regenerate
    User.all.destroy_all
    10.times { User.create(name: Faker::Name.name) }

    redirect_to delete_all_path
  end

  def destroy
    User.where("id = #{params[:user_id]}").delete_all

    redirect_to delete_all_path
  end

  def destroy_sanitized
    User.where(id: params[:user_id]).delete_all

    redirect_to delete_all_path
  end

  def destroy_all
    User.destroy_all

    redirect_to delete_all_path
  end
end
