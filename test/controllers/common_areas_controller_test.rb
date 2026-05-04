require "test_helper"

class CommonAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @common_area = common_areas(:one)
  end

  test "should get index" do
    get common_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_common_area_url
    assert_response :success
  end

  test "should create common_area" do
    assert_difference("CommonArea.count") do
      post common_areas_url, params: { common_area: { area_type: @common_area.area_type, community_id: @common_area.community_id, name: @common_area.name } }
    end

    assert_redirected_to common_area_url(CommonArea.last)
  end

  test "should show common_area" do
    get common_area_url(@common_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_common_area_url(@common_area)
    assert_response :success
  end

  test "should update common_area" do
    patch common_area_url(@common_area), params: { common_area: { area_type: @common_area.area_type, community_id: @common_area.community_id, name: @common_area.name } }
    assert_redirected_to common_area_url(@common_area)
  end

  test "should destroy common_area" do
    assert_difference("CommonArea.count", -1) do
      delete common_area_url(@common_area)
    end

    assert_redirected_to common_areas_url
  end
end
