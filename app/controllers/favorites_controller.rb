class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id)
    favorite.save
    #redirect_to request.referer
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    #redirect_to request.referer
  end 
  def followings
		user = User.find(params[:user_id])
		@users = user.followings
  end

  def followers
		user = User.find(params[:user_id])
		@users = user.followers
  end
end

