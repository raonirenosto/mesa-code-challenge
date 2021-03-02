require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email should be required" do
    assert User.create.errors[:email].any?
  end

  test "password should be required" do
    assert User.create.errors[:password].any?
  end
  
  test "email should not be duplicated on db" do
    jhon = users(:jhon)
    assert User.create(email: jhon.email).errors[:email].any?,
      "email should not be duplicated"
  end

  test "user should be created" do
    assert_not User.create(
      email: "any@email.com",
      password: "asd123").errors.any?,
        "user should be created"
  end
end
