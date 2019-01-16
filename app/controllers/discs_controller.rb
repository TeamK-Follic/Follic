class DiscsController < ApplicationController
   def create
	disc = Disc.new(disc_params)
	disc.save
	redirect_to
   end

   def update
	disc = Disc.find(disc_params)
	disc.update
	redirect_to discs_path
   end

   def destroy
	disc = Disc.find(params[:id])
	disc.destroy
	redirect_to
   end

   private
   def disc_params
   params.require(:disc).permit(:item_id, :name)
   end
end
