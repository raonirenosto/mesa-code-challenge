require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest
  test "create user" do
    post api_v1_users_path, params: params, as: :json

    assert_response :created
    
    body = JSON.parse(response.body)
    
    assert_equal "raonicoelho@gmail.com", body["email"]
    assert_not_nil body["id"]

    # should have only "id" and email
    assert body.size == 2

    assert User.where(email: "raonicoelho@gmail.com").size == 1
  end

  test "duplicated email" do
    jhon = users(:jhon)

    post api_v1_users_path, params: params, as: :json
    post api_v1_users_path, params: params, as: :json

    assert_response :unprocessable_entity
  end

  def params
    {
      "email": "raonicoelho@gmail.com",
      "password": "asd123"
    }
  end
end
