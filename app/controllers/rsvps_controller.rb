class RsvpsController < ApplicationController
  before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

    protect_from_forgery except: [:hook]

  def index
    @rsvps = Rsvp.all
    authorize @rsvps
    @event = Event.find(params[:event_id])
  end

  def admin_index
    @event = Event.find(params[:event_id])
    @rsvps = @event.rsvps.includes(:attendees)
  end

  def show
    paypal_url_service = PaypalUrlCreator.new(@rsvp)
    @paypal_url = paypal_url_service.call(event_rsvp_path(@event, @rsvp))
  end

  def new
    @rsvp = Rsvp.new(event_id: params[:event_id])
    authorize @rsvp
    @event = Event.find(params[:event_id])
    @classmate_attendee = @rsvp.attendees.build(name: current_classmate.full_name)
    7.times { @rsvp.attendees.build }
  end

  def edit
    6.times { @rsvp.attendees.build }
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
      redirect_to event_rsvp_path(@rsvp.event_id, @rsvp.id), notice: 'Rsvp was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(@rsvp.event_id)
    @rsvp.destroy
    redirect_to event_path(@event), notice: 'Rsvp was successfully destroyed.'
  end

  def hook
    @rsvp = Rsvp.find(params[:item_number])
    PayRsvp.new(params, "paypal", @rsvp).call
    render nothing: true
  end

  private
    def set_rsvp
      @rsvp = Rsvp.includes(attendees: :event_option).find(params[:id])
      @event = Event.find(params[:event_id])
    end

    def rsvp_params
      params.require(:rsvp).permit(:classmate_id, :total_cost, :event_id, :payment_status, attendees_attributes: [:id, :name, :event_option_id, :rsvp_id])
    end
end
