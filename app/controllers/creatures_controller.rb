class CreaturesController < ApplicationController
  #display all creatures
  def index
    @creatures = Creature.all
  end

  def new
    @creatures = Creature.new
  end

  def create
    creature_params = params.require(:creature).permit(:name, :description)
    creature = Creature.new(creature_params)
    if @creatures.save
      redirect_to @creatures_path
    else
      render "new"
    end
  end

  def show
    #get the creature id from the url params
    creature_id = params[:id]
    @creature = Creature.find(creature_id)
  end

  def edit
    @creature = Creature.find(params[:id])
  end

  def update
    creature_id = params[:id]
    creature = Creature.find(creature_id)
    #whitelist params and save them to the variable
    creature_params = params.require(:creature).permit(:name, :description)
    #update the creature
    creature.update_attributes(creature_params)
    #redirect_to show page for the updated creature
    redirect_to creature_path(creature)
  end

  # def update
  #   @creature = Creature.find(params[:id])
  #   if(@creature.update(creature_params_id))
  #     redirect_to @creature
  #   else
  #     render "edit"
  #   end
  # end
end
