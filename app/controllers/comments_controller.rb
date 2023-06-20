class CommentsController < ApplicationController
  before_action :current_comment, only: %i[edit update destroy]
  before_action :current_event, only: %i[new event_comments]

  def user_comments
    @comments = @current_user.comments
  end

  def event_comments
    @comments = @event.comments
  end

  def new
    @comment = @event.comments.build
  end

  def create
    @comment = Comment.new(comment_params)
    update_comment(@comment)
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

  def current_event
    @event = Event.find(params[:eventid])
  end

  def update_comment(comment)
    comment.update(user_id: current_user.id, event_id: params[:event_id])
  end
end
