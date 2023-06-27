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

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_index_path, notice: 'Food was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])

    respond_to do |format|
      if @food.destroy
        format.turbo_stream { flash.now[:notice] = 'Food was successfully destroyed.' }

      else
        render :index
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity).each do |key, value|
      params[:food][key] = value.strip if value.is_a?(String)
    end
  end
end
