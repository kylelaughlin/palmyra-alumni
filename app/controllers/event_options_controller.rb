class EventOptionsController < ApplicationController
  before_action :set_event_option, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  def index
    @event_options = EventOption.all
  end

  def show
  end

  def new
    @event_option = EventOption.new
  end

  def edit
  end

  def create
    @event_option = @event.event_options.build(event_option_params)
    if @event_option.save
      redirect_to edit_event_path(@event), notice: 'Event option was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event_option.update(event_option_params)
      redirect_to edit_event_path(@event), notice: 'Event option was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event_option.destroy
    redirect_to edit_event_path(@event), notice: 'Event option was successfully destroyed.'
  end

  private
    def set_event_option
      @event_option = EventOption.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def event_option_params
      params.require(:event_option).permit(:name, :price)
    end
end
