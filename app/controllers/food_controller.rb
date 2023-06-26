class FoodController < ApplicationController
  def index
    @foods = Food.all.where(user_id: current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(user_id: current_user.id, **food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to food_index_path, notice: 'Food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
