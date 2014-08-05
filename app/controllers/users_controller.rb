class UsersController < ApplicationController
  def create
    facebook_info = get_facebook_info
    name = facebook_info["name"]
    facebook_id = facebook_info[facebook_id]
    if current_user
      current_user.update(name: name)
    else
      User.create(facebook_id: facebook_id, name: name)
    end

    redirect_to dashboard_path
  end
end
