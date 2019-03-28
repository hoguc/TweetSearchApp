class LikesController < ApplicationController
  def create
    @liketweet = params[:liketweet]    
  end

  def destroy
  end
end
