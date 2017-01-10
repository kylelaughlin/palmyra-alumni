class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  def index
    @attendees = Attendee.all
  end

  def admin_index
    @event = Event.find(params[:event_id])
    @attendees = Attendee.joins(:rsvp).where(rsvps: {event_id: @event.id})
  end

  def show
  end

  def new
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.find(params[:rsvp_id])
    @attendee = Attendee.new
  end

  def edit
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.find(params[:rsvp_id])
    @attendee = @rsvp.attendees.build(attendee_params)
    if @attendee.save
      @rsvp.adjust_total_cost
      redirect_to edit_event_rsvp_path(@event, @rsvp), notice: 'Attendee was successfully created.'
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.find(params[:rsvp_id])
    if @attendee.update(attendee_params)
      redirect_to edit_event_rsvp_path(@event, @rsvp), notice: 'Attendee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.find(params[:rsvp_id])
    @attendee.destroy
    @rsvp.adjust_total_cost
    redirect_to edit_event_rsvp_path(@event, @rsvp), notice: 'Attendee was successfully destroyed.'
  end

  private
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    def attendee_params
      params.require(:attendee).permit(:name, :event_option_id)
    end
end
