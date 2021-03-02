require "test_helper"

class LoginUserTest < ActionDispatch::IntegrationTest
  test "should login user" do
    jhon = users(:jhon)

    post api_v1_logins_path, params: jhon, as: :json

    assert_response :ok

    body = JSON.parse(response.body)
    assert_not_nil body["token"]
  end

  test "should return unauthorized" do
    post api_v1_logins_path, params: unauthorized_user, as: :json

    assert_response :unauthorized
  end

  def unauthorized_user
    {
      "email": "any",
      "password": "any"
    }
  end
end
