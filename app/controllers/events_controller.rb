class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
  	event = Event.new(event_params)
    event.save
    redirect_to events_show_path
  end

  def update
  	event = Event.find(params[:id])
    event.update(event_params)
    redirect_to events_show_path
  end

  def destroy
  	event = Event.find(params[:id])
    event.destroy
    redirect_to artists_show_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :artist_id, :detail, :datetime)
  end
end
