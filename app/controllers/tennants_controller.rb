class TennantsController < ApplicationController

  def create
    @tennant = Tennant.new( tennant_params )
    @building = Building.find_by( street_address: params[:address] ) if params[:address].to_i != 0
    @tennant.building_id = @building.try(:id)

    if @tennant.save
      redirect_to owner_path( @building.owner ), notice: 'Tennet has been created'
    else
      render owner_path( @building.owner )
    end

  end

  def tennant_params
    params.require(:tennant).permit(:first_name, :last_name, :email )
  end

end
