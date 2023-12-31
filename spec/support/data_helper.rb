def data
  @user_one = User.create(name: 'Adarsh Pathak', email: 'Adarsh.pathak@example.com', password: 123_456,
                          confirmed_at: DateTime.now)
  @user_two = User.create(name: 'Stephen Adom', email: 'Stephen.Adom@example.com', password: 123_456,
                          confirmed_at: DateTime.now)
  @food_one = Food.create(name: 'apple', measurement_unit: 'Kilograms', price: 12, quantity: 10,
                          user_id: @user_one.id)
  @food_two = Food.create(name: 'orange', measurement_unit: 'Kilograms', price: 10, quantity: 5,
                          user_id: @user_one.id)
  @food_three = Food.create(name: 'rice', measurement_unit: 'Kilograms', price: 16, quantity: 20,
                            user_id: @user_one.id)
  @food_four = Food.create(name: 'pulse', measurement_unit: 'Kilograms', price: 20, quantity: 13,
                           user_id: @user_two.id)
  @food_five = Food.create(name: 'banana', measurement_unit: 'Kilograms', price: 6, quantity: 5, user_id: @user_two.id)
  @food_six = Food.create(name: 'musterd oil', measurement_unit: 'Cups', price: 9, quantity: 6,
                          user_id: @user_two.id)
  @recipe_one = Recipe.create(name: 'paratha', preparation_time: 2, cooking_time: 2, description: 'anything we want',
                              user_id: @user_one.id)
  @recipe_two = Recipe.create(name: 'juice', preparation_time: 2, cooking_time: 2, description: 'anything we want',
                              public: true,
                              user_id: @user_one.id)
  @recipe_three = Recipe.create(name: 'Dosa', preparation_time: 2, cooking_time: 2, description: 'anything we want',
                                public: true,
                                user_id: @user_one.id)
  @recipe_four = Recipe.create(name: 'Icecream', preparation_time: 2, cooking_time: 2, public: true,
                               description: 'anything we want', user_id: @user_two.id)
  @recipe_five = Recipe.create(name: 'soda', preparation_time: 2, cooking_time: 2, description: 'anything we want',
                               user_id: @user_two.id)
  @recipe_six = Recipe.create(name: 'roka', preparation_time: 2, cooking_time: 2, description: 'anything we want',
                              user_id: @user_two.id)
  @recipe_food = RecipeFood.create(food_id: @food_two.id, recipe_id: @recipe_two.id, quantity: 15)
end
