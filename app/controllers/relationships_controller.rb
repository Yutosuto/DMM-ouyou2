class RelationshipsController < ApplicationController
 before_action :authenticate_user!
  def create
	current_user.follow(params[:user_id])
	redirect_to request.referer
  end

  def destroy
	current_user.unfollow(params[:user_id])
	redirect_to request.referer
  end
  
  def follow
	current_user.follow(params[:id])
	redirect_to user_path
  end

  def unfollow
	current_user.unfollow(params[:id])
	redirect_to user_path
  end
  
  def followers
   @users = current_user.follower_user
  end
  
  def followings
   @users = current_user.following_user
  end 
end

