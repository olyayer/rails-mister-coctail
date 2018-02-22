class DosesController < ApplicationController
before_action :set_cocktail, only: [:new, :create]
before_action :set_dose, only: [:destroy]



  def new
    @dose = Dose.new

  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to @cocktail # cocktail_path(@cocktail) - alternative syntax
    else
      render :new
    end
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy

  end



  private

  def set_dose
    @dose = Dose.find(params[:id])

  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])

  end


  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end




end
