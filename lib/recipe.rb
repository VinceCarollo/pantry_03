class Recipe
  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = {}
  end

  def add_ingredient(ingredient, qty_needed)
    @ingredients[ingredient] = qty_needed
  end

  def check_qty(ingredient_needed)
    @ingredients.find do |ingredient, qty_needed|
      qty_needed if ingredient == ingredient_needed
    end[1]
  end

  def total_calories
    @ingredients.keys.sum{|ingredient| ingredient.calories}
  end

end
