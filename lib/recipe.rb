class Recipe
  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = []
  end

  def add_ingredient(ingredient, qty_needed)
    ingredient_info = {}
    ingredient_info[qty_needed] = ingredient
    @ingredients << ingredient_info
  end

  def check_qty(ingredient_needed)
    qty = 0
    @ingredients.each do |ingredient_info|
      qty = ingredient_info.find do |qty_needed, ingredient|
        ingredient == ingredient_needed
      end
    end
    qty.first
  end

  def total_ingredients
    total_cals = 0
    @ingredients.each do |ingredient_info|
      total_cals += ingredient_info.sum do |qty_needed, ingredient|
        ingredient.calories
      end
    end
    total_cals
  end
end
