require "test_helper"

class PlaceTest < ActiveSupport::TestCase
  test "name should be required" do
    assert Place.create.errors[:name].any?
  end

  test "city should be required" do
    assert Place.create.errors[:city].any?
  end

  test "street should be required" do
    assert Place.create.errors[:street].any?
  end

  test "country should be required" do
    assert Place.create.errors[:country].any?
  end

  test "place should be created" do
    assert_not Place.create(
      name: "Any",
      city: "Any",
      street: "Any",
      country: "Any").errors.any?,
        "place should be created"
  end
end
