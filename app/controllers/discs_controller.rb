class DiscsController < ApplicationController
   # before_action :authenticate_manager!

   def create
   	disc = Disc.new(disc_params)
   	disc.save
   end

   def update
   	disc = Disc.find(disc_params)
   	disc.update
   end

   def destroy
   	disc = Disc.find(params[:id])
   	disc.destroy
   end

   private

   def disc_params
      params.require(:disc).permit(:item_id, :name,
         musics_attributes: [:id, :disc_id, :track_number, :name, :_destroy]
      )
   end
end