require 'test_helper'

class LicensesControllerTest < ActionController::TestCase
  setup do
    @license = licenses(:one)
    @admin  = users(:one)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new" do
    log_in_as(@admin)
    get :new
    assert_response :success
  end

  test "should create license" do
    log_in_as(@admin)
    assert_difference('License.count') do
      post :create, license: { companyName: @license.companyName, consumerAmount: @license.consumerAmount, consumerType: @license.consumerType, contactEmail: @license.contactEmail, contactName: @license.contactName, holder: @license.holder, info: @license.info, issuer: @license.issuer, notAfter: @license.notAfter, subject: @license.subject, user_id: @license.user_id }
    end

    assert_redirected_to license_path(assigns(:license))
  end

#  test "should show license" do
#    log_in_as(@admin)
#    get :show, id: @license
#    assert_response :success
#  end

  test "should get edit" do
    log_in_as(@admin)
    get :edit, id: @license
    assert_response :success
  end

  test "should update license" do
    log_in_as(@admin)
    patch :update, id: @license, license: { companyName: @license.companyName, consumerAmount: @license.consumerAmount, consumerType: @license.consumerType, contactEmail: @license.contactEmail, contactName: @license.contactName, holder: @license.holder, info: @license.info, issuer: @license.issuer, notAfter: @license.notAfter, subject: @license.subject, user_id: @license.user_id }
    assert_redirected_to license_path(assigns(:license))
  end

  test "should destroy license" do
    log_in_as(@admin)
    assert_difference('License.count', -1) do
      delete :destroy, id: @license
    end

    assert_redirected_to licenses_path
  end
end
