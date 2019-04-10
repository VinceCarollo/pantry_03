require 'pry'
class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def restock(ingredient, qty)
    if !stock.keys.include?(ingredient)
      stock[ingredient] = qty
    else
      stock[ingredient] += qty
    end
  end

  def stock_check(ingredient_needed)
    @stock.sum do |ingredient, qty|
      qty if ingredient == ingredient_needed
    end
  end

  def enough_ingredients_for?(recipe)
    enough_ingredients = false
    recipe.ingredients.each do |ingredient_needed, qty_needed|
      if @stock.include?(ingredient_needed)
        enough_ingredients = @stock[ingredient_needed] > qty_needed
      end
      return enough_ingredients if !enough_ingredients
    end

    enough_ingredients = recipe.ingredients.all?{|ingredient_needed, qty_needed| @stock.include?(ingredient_needed)}

    enough_ingredients
  end
end
