class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @attendance = current_user.attendances.build(attendance_params)

    if @attendance.save
      flash[:notice] = "You have successfully registered for the event."
    else
      flash[:alert] = @attendance.errors.full_messages.to_sentence
    end

    redirect_to @attendance.event
  end

  private

  def attendance_params
    params.permit(:event_id)
  end
end
