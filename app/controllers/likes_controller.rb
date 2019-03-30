class LikesController < ApplicationController
  def create
    @liketweet = Like.create(user_id: current_user.id, liketweet: params[:liketweet]) 

    get_like
    render "index"
  end

  def destroy    
    @liketweet = Like.find_by(liketweet: params[:liketweet])
    if @liketweet.destroy
      get_like
      render "index"
    end
  end

  def index
    get_like
  end

  private

  #お気に入りツイートを取得し、表示する
  def get_like
    @likes = Like.where(user_id: current_user.id)
    @likes = Kaminari.paginate_array(@likes).page(params[:page]).per(10)   
  end
end
