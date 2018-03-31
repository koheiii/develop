class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.live_id = params[:live_id]
    if favorite.save
      redirect_to lives_index_path, notice: 'お気に入りに登録しました'
    else
      redirect_to lives_index_path, notice: 'お気に入りに登録に失敗しました'
    end
  end

  def cancel_fav
    @favorite = Favorite.find_by user_id:current_user.id, live_id:params[:live_id]

    if @favorite.destroy
      redirect_to lives_index_path, notice: 'お気に入りを解除しました'
    end
  end

  def index
    @favorite_lives = current_user.favorite_lives
  end
end
