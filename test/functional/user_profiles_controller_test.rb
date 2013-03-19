require 'test_helper'

class UserProfilesControllerTest < ActionController::TestCase
  setup do
    @user_profile = user_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_profile" do
    assert_difference('UserProfile.count') do
      post :create, user_profile: { city: @user_profile.city, county: @user_profile.county, first_name: @user_profile.first_name, last_name: @user_profile.last_name, latitude: @user_profile.latitude, longitude: @user_profile.longitude, physical_address: @user_profile.physical_address, postal_zip_code: @user_profile.postal_zip_code, state: @user_profile.state, unit_no: @user_profile.unit_no }
    end

    assert_redirected_to user_profile_path(assigns(:user_profile))
  end

  test "should show user_profile" do
    get :show, id: @user_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_profile
    assert_response :success
  end

  test "should update user_profile" do
    put :update, id: @user_profile, user_profile: { city: @user_profile.city, county: @user_profile.county, first_name: @user_profile.first_name, last_name: @user_profile.last_name, latitude: @user_profile.latitude, longitude: @user_profile.longitude, physical_address: @user_profile.physical_address, postal_zip_code: @user_profile.postal_zip_code, state: @user_profile.state, unit_no: @user_profile.unit_no }
    assert_redirected_to user_profile_path(assigns(:user_profile))
  end

  test "should destroy user_profile" do
    assert_difference('UserProfile.count', -1) do
      delete :destroy, id: @user_profile
    end

    assert_redirected_to user_profiles_path
  end
end
