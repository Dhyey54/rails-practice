class EventsController < ApplicationController
  before_action :user_event, only: %i[show edit update destroy]
  before_action :categories,only: %i[index new edit search]
  before_action :events, only: %i[index search]

  def index
  end

  def show
    @category = Category.find_by(id: @event[:category_id])
    @comments = Comment.where(event_id: params[:id], user_id: @current_user[:id])
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      Enrollment.create(event_id: @event.id, user_id: @current_user[:id], created: true)
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
    @events = @events.where(category_id: params[:category_id])
    render :index
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy

    redirect_to events_path, status: :see_other
  end

  private
  def events
    @events = Event.where(id: Enrollment.where(user_id: @current_user[:id], created: true).pluck(:event_id)).order(id: :desc)
  end

  def user_event
    @event = Event.find_by(id: Enrollment.where(user_id: @current_user[:id], event_id: params[:id]).pluck(:event_id))
  end

  def categories
    @categories = Category.all
  end

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :category_id)
  end
end
