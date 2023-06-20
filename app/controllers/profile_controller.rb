class ProfileController < ApplicationController
  before_action :enrolled_event, only: :index
  before_action :user_profile

  def index
    @comments = @current_user.comments
    @address = Address.find_by(user_id: @current_user.id)
    @profile_events = Event.order(id: :desc).find(@enrolled_event)
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_index_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Enrollment.where(event_id: params[:id], user_id: @current_user.id, owner: false).first.destroy

    redirect_to profile_index_path
  end

  private
  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :phone)
  end
  def user_profile
    @profile = @current_user.profile
  end
end
