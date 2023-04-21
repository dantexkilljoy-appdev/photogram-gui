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

  def add

    fetched_user = params.fetch("query_user")

    a_new_user = User.new
    a_new_user.username = fetched_user

    a_new_user.save

    #render({ template: "user_templates/add.html.erb"})

    redirect_to("/users/" + a_new_user.username.to_s)
  end

  def update

    the_id = params.fetch("update_id")

    matching_users = User.where({ id: the_id })

    the_user = matching_users.first

    fetched_user = params.fetch("input_username")

    the_user.username = fetched_user

    the_user.save

    redirect_to("/users/" + the_user.username.to_s)
  end

end
