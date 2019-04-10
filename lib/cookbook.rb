class Cookbook
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    summary = []
    recipe_info = {}
    @recipes.each do |recipe|
      recipe_info[:name] = recipe.name
      recipe_info[:details] = recipe
      recipe_info[:total_calories] = recipe.total_calories
    end
    summary << recipe_info
  end
end
