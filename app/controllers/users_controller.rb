class UsersController < ApplicationController
  def create
    graph = Koala::Facebook::API.new(session[:access_token])
    user = graph.get_object("me")
    facebook_id = user["id"]
    if User.find_by(facebook_id: facebook_id)
    else
      User.create(facebook_id: facebook_id, name: facebook_id)
    end

    redirect_to dashboard_path
  end

  def edit
    @current_user = current_user
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to [:dashboard]
    else
      render :edit
    end

  end

  def user_params
    params.require(:user).permit(
      :name
    )
  end
end
