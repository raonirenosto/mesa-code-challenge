require "test_helper"

class GetUserTest < ActionDispatch::IntegrationTest
  test "get user" do
    jhon = users(:jhon)

    get api_v1_user_path(jhon.id), headers: generate_token(jhon.id)

    assert_response :ok

    body = JSON.parse(response.body)

    assert_equal jhon.id, body["id"]
    assert_equal jhon.email, body["email"]

    # should have only "id" and email
    assert body.size == 2
  end

  test "get user without token" do
    jhon = users(:jhon)

    get api_v1_user_path(jhon.id)

    assert_response :unauthorized
  end
end
