class EventsController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :edit, :create, :update, :destroy]

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
    @artist = Artist.find(params[:artist_id])
    @event = @artist.events.new(event_params)
  	@event.artist_id = @artist.id
    if @event.save
      redirect_to event_path(@event.id), notice: 'イベントを追加しました'
    else
      flash.now[:alert] = 'イベントの追加に失敗しました'
      render :new
    end
  end

  def update
  	@event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id), notice: 'イベントを編集しました'
    else
      flash.now[:alert] = 'イベントの編集に失敗しました'
      render :new
    end
  end

  def destroy
  	event = Event.find(params[:id])
    event.destroy
    redirect_to artists_path, notice: 'イベントを削除しました'
  end

  private

  def event_params
    params.require(:event).permit(:name, :artist_id, :detail, :datetime)
  end
end
