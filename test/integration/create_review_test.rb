require "test_helper"

class CreateReviewTest < ActionDispatch::IntegrationTest
  test "create review" do
    empire_state = places(:empire_state)

    post api_v1_place_reviews_path(empire_state.id), 
      params: params, headers: generate_token

    assert_response :created

    body = JSON.parse(response.body)

    assert_not_nil body["id"]
    assert_equal 5, body["rating"]
    assert_equal "Awesome place", body["comment"]

    assert_equal 1, empire_state.reviews.count
  end

  test "create review without token" do
    empire_state = places(:empire_state)

    post api_v1_place_reviews_path(empire_state.id), params: params

    assert_response :unauthorized
  end

  def params
    {
      "rating": 5,
      "comment": "Awesome place"
    }
  end
end
