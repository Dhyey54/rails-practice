class EnrollmentsController < ApplicationController
  before_action :enrolled_event, only: :index

  def index
    @enrollable_events = Event.find(Enrollment.where(owner: true).where.not(user_id: @current_user.id).pluck(:event_id))
  end

  def create
    @enrollment = Enrollment.create(event_id: params[:eventid], user_id: @current_user.id, owner: false)

    if @enrollment.save
      flash[:notice] = "You have enrolled successfully"
      redirect_to enrollments_path
    else
      render :new, status: :unprocessable_entity
    end 
  end
end
