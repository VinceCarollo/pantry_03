require 'minitest/autorun'
require './lib/ingredient'

class IngredientTest < Minitest::Test
  attr_reader :ginger

  def setup
    @ginger = Ingredient.new('ginger', 'gram', 25)
  end

  def test_it_exists
    assert_instance_of Ingredient, ginger
  end

  def test_it_has_attributes
    assert_equal 'ginger', ginger.name
    assert_equal 'gram', ginger.unit
    assert_equal 25, ginger.calories
  end
end
