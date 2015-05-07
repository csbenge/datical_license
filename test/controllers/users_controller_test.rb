require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @admin  = users(:one)
    @user   = users(:three)
    @other_user = users(:four)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { firstname: @user.firstname, lastname: @user.lastname, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { firstname: @user.firstname, lastname: @user.lastname, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch :update, id: @other_user, user: { password:              "password",
                                            password_confirmation: "password",
                                            admin: true }
    assert_not @other_user.admin?
  end

  test "should not allow admin to delete themself" do
    log_in_as(@admin)
    assert_no_difference 'User.count' do
      delete :destroy, id: @admin
    end
    assert_not flash.empty?
    assert_redirected_to users_url
  end
=begin
  test "should allow user delete themself" do
    log_in_as(@user)
    assert_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end
=end
end
