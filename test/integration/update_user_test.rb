require "test_helper"

class UpdateUserTest < ActionDispatch::IntegrationTest
  test "update user" do
    jhon = users(:jhon)

    patch api_v1_user_path(jhon.id), params: params, 
      as: :json, headers: generate_token

    assert_response :ok

    body = JSON.parse(response.body)

    assert_equal "jhon@newemail.com", body["email"]

    # check if passsword was changed
    user = authenticate_user "jhon@newemail.com", "newpassword"
    asser_not_nil user

    # should have only "id" and email
    assert_not_nil body["id"]
    assert body.size == 2
  end

  test "update user without token" do
    jhon = users(:jhon)

    patch api_v1_user_path(jhon.id)

    assert_response :unauthorized
  end

  def params
    {
      "email": "jhon@newemail.com",
      "password": "newpassword"
    }
  end
end
