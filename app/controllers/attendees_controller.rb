class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  def index
    @attendees = Attendee.all
  end

  def show
  end

  def new
    @attendee = Attendee.new
  end

  def edit
  end

  def create
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      redirect_to @attendee, notice: 'Attendee was successfully created.'
    else
      render :new
    end
  end

  def update
      if @attendee.update(attendee_params)
        redirect_to @attendee, notice: 'Attendee was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @attendee.destroy
    redirect_to attendees_url, notice: 'Attendee was successfully destroyed.'
  end

  private
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    def attendee_params
      params.require(:attendee).permit(:rsvp_id, :name, :event_option_id)
    end
end
