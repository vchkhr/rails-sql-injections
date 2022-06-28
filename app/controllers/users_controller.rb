class UsersController < ApplicationController
  def regenerate
    User.all.destroy_all
    10.times { User.create(name: Faker::Name.name, is_admin: User.all.count == 3) }

    redirect_back(fallback_location: root_path)
  end

  def destroy
    User.where("id = #{params[:user_id]}").delete_all

    redirect_back(fallback_location: root_path)
  end

  def destroy_sanitized
    User.where(id: params[:user_id]).delete_all

    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    User.destroy_all

    redirect_back(fallback_location: root_path)
  end

  def find_by
    user_search = User.find_by(params[:id])

    render turbo_stream: turbo_stream.replace(:user, partial: "users/user", locals: { user: user_search })
  end

  def find_by_sanitized
    user_search = User.find_by(id: params[:id])

    render turbo_stream: turbo_stream.replace(:user, partial: "users/user", locals: { user: user_search })
  end
end
