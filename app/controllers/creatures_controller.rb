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
    @creature = Creature.find_by_id(creature_id)
  end

  def update
    @creatures = Creature.find(params[:id])
    if(@creature.update(creature_params))
      redirect_to @creature
    else
      render "edit"
    end
end
