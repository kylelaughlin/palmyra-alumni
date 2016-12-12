class RsvpsController < ApplicationController
  before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

    protect_from_forgery except: [:hook]

  def index
    @rsvps = Rsvp.all
    @event = Event.find(params[:event_id])
  end

  def show
    paypal_url_service = PaypalUrlCreator.new(@rsvp)
    @paypal_url = paypal_url_service.call(event_rsvp_path(@event, @rsvp))
  end

  def new
    @rsvp = Rsvp.new
    @event = Event.find(params[:event_id])
    @classmate_attendee = @rsvp.attendees.build(name: current_classmate.full_name)
    7.times { @rsvp.attendees.build }
  end

  def edit
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    @event = Event.find(params[:event_id])
    if @rsvp.save
      redirect_to event_rsvp_path(@event, @rsvp), notice: 'Rsvp was successfully created.'
    else
      render :new
    end
  end

  def update
    if @rsvp.update(rsvp_params)
      redirect_to @rsvp, notice: 'Rsvp was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @rsvp.destroy
    redirect_to rsvps_url, notice: 'Rsvp was successfully destroyed.'
  end

  def hook
    byebug
  end

  private
    def set_rsvp
      @rsvp = Rsvp.includes(attendees: :event_option).find(params[:id])
      @event = Event.find(params[:event_id])
    end

    def rsvp_params
      params.require(:rsvp).permit(:classmate_id, :total_cost, :event_id, :payment_status, attendees_attributes: [:name, :event_option_id, :rsvp_id])
    end
end
