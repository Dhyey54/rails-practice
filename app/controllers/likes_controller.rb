class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: @current_user.id, comment_id: params[:commentid])
    if @like.save
      redirect_to event_comments_path(params[:eventid])
    else
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.find_by(comment_id: params[:commentid], user_id: @current_user.id)
    @like.destroy

    redirect_to event_comments_path(params[:eventid])
  end
end
