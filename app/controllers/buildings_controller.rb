class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create

    first_name = params[:owner].split.first
    last_name  = params[:owner].split.last
    owner = Owner.find_by( first_name: first_name, last_name: last_name )

    @building = Building.new( building_params )
    @building.owner_id = owner.try(:id)
    if @building.save
      redirect_to new_building_path, notice: 'Building has been created'
    else
      render new_building_path
    end

  end

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :postal_code, :description )
  end
end
