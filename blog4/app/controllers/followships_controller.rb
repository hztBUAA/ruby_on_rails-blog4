# frozen_string_literal: true

class FollowshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:id])
    current_user.follow(@user)
    respond_to do |format|
      # format.js {} # 指定响应格式为 JavaScript
      format.html { redirect_to "/users/index" }

    end
  end


  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    respond_to do |format|
      # format.js{}
      # format.html
      format.html { redirect_to "/users/index" }
      # redirect_to "users/index"
    end
  end
end
