class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(idea_id: params[:idea_id])
    redirect_to ideas_url, notice: "#{favorite.idea.user.name}さんのアイディアを「いいね」しました"
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id].destroy)
    redirect_to ideas_url, notice: "#{favorite.idea.user.name}さんのアイディアを「いいね」解除しました"
  end
  
end