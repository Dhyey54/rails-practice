class CommentsController < ApplicationController
  before_action :current_comment, only: %i[edit update destroy]

  def user_comments
    @comments = @current_user.comments
  end

  def event_comments
    @comments = Comment.where(event_id: params[:eventid])
  end

  def new
    @event = Event.find(params[:eventid])
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new(user_comment: comment_params[:user_comment], event_id: params[:event_id], user_id: @current_user.id)
    
    if @comment.save
      redirect_to event_comments_path(params[:event_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to event_comments_path(@comment.event_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    @comment.destroy
    redirect_to events_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_comment, :event_id, :user_id)
  end

  def current_comment
    @comment = Comment.find(params[:id])
  end
end
