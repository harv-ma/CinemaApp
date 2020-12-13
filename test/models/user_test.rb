require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    # start of will valid data
    @user = User.new
    @user.forename = 'Testuser'
    @user.surname = 'Smith'
    @user.phonenumber = '0777213123'
    @user.email = 'example@example.com'
    @user.password = 'password'
    @user.password_confirmation = 'password'
    @user.admin = false
  end

  test "validate correct details" do 
    @user.save
    assert @user.valid?
  end

  test "validate incorrect email" do
    @user.email = "incorrecT:@@emailsd./com"
    @user.save
    assert @user.invalid?
  end

  test "email already exists" do
    @user.email = "user@example.com"
    @user.save
    assert @user.invalid?
  end

  test "validate incorrect confirmation" do
    @user.password_confirmation = "asdasdasd"
    @user.save
    assert @user.invalid?
  end

  test "validate incorrect forename" do
    @user.forename = ""
    @user.save
    assert @user.invalid?
  end

  test "validate incorrect surname" do
    @user.surname = ""
    @user.save
    assert @user.invalid?
  end
end
