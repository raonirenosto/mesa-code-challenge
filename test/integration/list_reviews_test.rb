require "test_helper"

class ListReviewsTest < ActionDispatch::IntegrationTest
  test "the truth" do
    unimed = places(:unimed)

    get api_v1_place_reviews_path(unimed.id), headers: generate_token

    body = JSON.parse(response.body)

    assert_response :ok
    assert_equal 2, body.size
  end
end
