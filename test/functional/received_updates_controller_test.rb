require 'test_helper'

class ReceivedUpdatesControllerTest < ActionController::TestCase
  setup do
    @received_update = received_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:received_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create received_update" do
    assert_difference('ReceivedUpdate.count') do
      post :create, received_update: { agency_id: @received_update.agency_id, name: @received_update.name, object_id: @received_update.object_id, time: @received_update.time }
    end

    assert_redirected_to received_update_path(assigns(:received_update))
  end

  test "should show received_update" do
    get :show, id: @received_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @received_update
    assert_response :success
  end

  test "should update received_update" do
    put :update, id: @received_update, received_update: { agency_id: @received_update.agency_id, name: @received_update.name, object_id: @received_update.object_id, time: @received_update.time }
    assert_redirected_to received_update_path(assigns(:received_update))
  end

  test "should destroy received_update" do
    assert_difference('ReceivedUpdate.count', -1) do
      delete :destroy, id: @received_update
    end

    assert_redirected_to received_updates_path
  end
end
