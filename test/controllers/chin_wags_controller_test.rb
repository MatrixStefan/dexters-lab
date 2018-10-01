require 'test_helper'

class ChinWagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chin_wag = chin_wags(:one)
  end

  test "should get index" do
    get chin_wags_url
    assert_response :success
  end

  test "should get new" do
    get new_chin_wag_url
    assert_response :success
  end

  test "should create chin_wag" do
    assert_difference('ChinWag.count') do
      post chin_wags_url, params: { chin_wag: { message: @chin_wag.message, text: @chin_wag.text } }
    end

    assert_redirected_to chin_wag_url(ChinWag.last)
  end

  test "should show chin_wag" do
    get chin_wag_url(@chin_wag)
    assert_response :success
  end

  test "should get edit" do
    get edit_chin_wag_url(@chin_wag)
    assert_response :success
  end

  test "should update chin_wag" do
    patch chin_wag_url(@chin_wag), params: { chin_wag: { message: @chin_wag.message, text: @chin_wag.text } }
    assert_redirected_to chin_wag_url(@chin_wag)
  end

  test "should destroy chin_wag" do
    assert_difference('ChinWag.count', -1) do
      delete chin_wag_url(@chin_wag)
    end

    assert_redirected_to chin_wags_url
  end
end
