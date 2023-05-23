class EventsController < ApplicationController
  before_action :user_event, only: %i[show edit update destroy]
  before_action :categories,only: %i[index new edit search]
  before_action :events, only: %i[index search]

  def index; end

  def show
    @category = @event.category
    @comments = @event.comments
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      @current_user.enrollments.create(event_id: @event.id, owner: true)
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
    @events = Event.order(id: :desc).find(@current_user.enrollments.where(owner: true).pluck(:event_id))
  end

  def user_event
    @event = Event.find_by(id: @current_user.enrollments.where(owner: true, event_id: params[:id]).pluck(:event_id))
  end

  def categories
    @categories = Category.all
  end

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :category_id)
  end
end
