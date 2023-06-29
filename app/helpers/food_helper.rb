module FoodHelper
  # In your controller or helper method
  def measurement_units_for_food_select
    measurement_units = %w[Pounds Grams Kilograms Ounces Cups Teaspoons Tablespoons]
    measurement_units.sort
  end

  def field_error(errors, label)
    return 'is-invalid' if errors[label].present?
  end
end
