class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all

  end

  def new
    @cocktail = Cocktail.new

  end

  def create
    @cocktail = Cocktail.new(coctail_params)

    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def show
    @cocltail = Cocktail.find(params[:id])

  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)

  end
end
