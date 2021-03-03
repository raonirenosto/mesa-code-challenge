require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "rating should be required" do
    assert Review.create.errors[:rating].any?
  end

  test "comment should be required" do
    assert Review.create.errors[:comment].any?
  end

  test "place should be required" do
    assert Review.create.errors[:place].any?
  end

  test "review should be created" do
    assert_not Review.create(
      rating: 5,
      comment: "Any",
      place: places(:empire_state)).errors.any?,
        "review should be created"
  end
end
