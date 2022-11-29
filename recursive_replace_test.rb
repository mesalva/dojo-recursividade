require 'minitest/autorun'
require_relative 'recursive_replace'

# Common test data version: 1.0.0 edf1778
class RecursiveReplaceTest < Minitest::Test
  def test_without_replace
    # skip
    assert_equal({ "field": "value" }, RecursiveReplace.new({ "field": "value" }).replace)
  end

  def test_first_level
    # skip
    assert_equal(
      { "field": "value" },
      RecursiveReplace.new({ "field": "%{variable}" }).replace(variable: "value")
    )
  end

  def test_inside_object
    # skip
    assert_equal(
      { "any_object": { "field": "value" }},
      RecursiveReplace.new({ "any_object": { "field": "%{variable}" } }).replace(variable: "value")
    )
  end

  def test_inside_array
    # skip
    assert_equal(
      { "any_array": ["value"] },
      RecursiveReplace.new({ "any_array": ["%{variable}"] }).replace(variable: "value")
    )
  end

  def test_inside_array_of_objects
    # skip
    assert_equal(
      { "any_array": [{ "field": "value" }] },
      RecursiveReplace.new({ "any_array": [{ "field": "%{variable}" }] }).replace(variable: "value")
    )
  end

  def test_complex
    # skip
    assert_equal(
      { "any_object": { "any_array": [{ "field": "value" }] } },
      RecursiveReplace.new({ "any_object": { "any_array": [{ "field": "%{variable}" }] } }).replace(variable: "value")
    )
  end
end
