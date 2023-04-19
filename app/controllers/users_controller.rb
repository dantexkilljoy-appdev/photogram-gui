class UsersController < ApplicationController
  def index

    matching_users = User.all

    @list_of_users = matching_users.order({ username: :asc })

    render({ template: "user_templates/index.html.erb" })

  end

  def show

    user_key = params.fetch("path_user")

    @path_user = User.where({ username: user_key }).first

    if @path_user == nil
      redirect_to("/404")
    else
      render({ template: "user_templates/show.html.erb" })
    end
  end
end
