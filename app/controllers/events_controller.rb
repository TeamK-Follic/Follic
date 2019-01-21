class EventsController < ApplicationController
  def new
    @event = Event.new
    @artist = Artist.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @artist = @event.artist
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    artist = Artist.find(params[:artist_id])
  	event.artist_id = artist.id
    event = artist.events.new(event_params)
    event.save
    redirect_to event_path(event.id)
  end

  def update
  	event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event_path(event.id)
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
