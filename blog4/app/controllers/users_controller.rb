class UsersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  def index
    users_in_one_page = 2;
    # @course=current_user.courses.paginate(:page=>params[:page],:per_page=>5)
    @users = User.all.paginate(:page=>params[:page],:per_page=>users_in_one_page)
    @in_page = params[:page] ? params[:page]:1
    @max_page = User.all.count.to_i / users_in_one_page
    if User.all.count.to_i % users_in_one_page != 0
      @max_page += 1
    end
  end

  def show
    # @user = current_user

    @user = User.find(params[:id])
    @followers = @user.followers
    @followings = @user.followings
    @current_user = current_user
    # @blogs = current_user.blogs.find[:]
    # @comment = current_user.blogs
  end
end
