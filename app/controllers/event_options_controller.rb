class EventOptionsController < ApplicationController
  before_action :set_event_option, only: [:show, :edit, :update, :destroy]
  before_action :set_event, except: [:destroy]

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
    @event_option = EventOption.new(event_option_params)

    respond_to do |format|
      if @event_option.save
        format.html { redirect_to @event_option, notice: 'Event option was successfully created.' }
        format.json { render :show, status: :created, location: @event_option }
      else
        format.html { render :new }
        format.json { render json: @event_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event_option.update(event_option_params)
        format.html { redirect_to @event_option, notice: 'Event option was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_option }
      else
        format.html { render :edit }
        format.json { render json: @event_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event_option.destroy
    respond_to do |format|
      format.html { redirect_to event_options_url, notice: 'Event option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event_option
      @event_option = EventOption.find(params[:id])
    end

    def set_event
      @events = Event.find(params[:event_id])
    end

    def event_option_params
      params.require(:event_option).permit(:name, :price)
    end
end
