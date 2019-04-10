require 'minitest/autorun'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  attr_reader :stir_fry, :ginger

  def setup
    @stir_fry = Recipe.new('stir fry')
  end

  def test_it_exists
    assert_instance_of Recipe, stir_fry
  end

  def test_it_has_attributes
    assert_equal 'stir fry', stir_fry.name
  end

  def test_it_can_add_ingredients
    ginger = Ingredient.new('ginger', 'gram', 25)
    bok_choy = Ingredient.new('bok choy', 'gram', 15)
    stir_fry.add_ingredient(ginger, 1)
    stir_fry.add_ingredient(bok_choy, 2)

    expected = {ginger => 1, bok_choy => 2}
    assert_equal expected, stir_fry.ingredients
  end

  def test_it_can_check_qty_needed
    ginger = Ingredient.new('ginger', 'gram', 25)
    bok_choy = Ingredient.new('bok choy', 'gram', 15)
    stir_fry.add_ingredient(ginger, 1)
    stir_fry.add_ingredient(bok_choy, 2)

    assert_equal 2, stir_fry.check_qty(bok_choy)
  end

  def test_it_can_get_total_calories
    ginger = Ingredient.new('ginger', 'gram', 25)
    bok_choy = Ingredient.new('bok choy', 'gram', 15)
    stir_fry.add_ingredient(ginger, 1)
    stir_fry.add_ingredient(bok_choy, 2)

    assert_equal 55, stir_fry.total_calories
  end
end
