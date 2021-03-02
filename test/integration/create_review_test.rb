require "test_helper"

class CreateReviewTest < ActionDispatch::IntegrationTest
  test "create review" do
    post api_v1_reviews_path, params: params, headers: generate_token

    assert_response :created

    assert_equal 5, body["rating"]
    assert_equal "Awesome place", body["comment"]
  end

  def params
    {
      "rating": 5,
      "comment": "Awesome place"
    }
  end
end
