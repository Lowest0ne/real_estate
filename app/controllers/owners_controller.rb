class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new( owner_params )
    if @owner.save
      redirect_to new_owner_path, notice: 'Owner has been created'
    else
      render new_owner_path
    end
  end

  def show
    @owner = Owner.find( params[:id] )
    @building = @owner.building
    @tennant = @building.tennants.build if @building
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company)
  end

end
