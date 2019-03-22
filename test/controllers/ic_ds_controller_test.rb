require 'test_helper'

class IcDsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @icd = icds(:one)
  end

  test "should get index" do
    get icds_url
    assert_response :success
  end

  test "should get new" do
    get new_icd_url
    assert_response :success
  end

  test "should create icd" do
    assert_difference('Icd.count') do
      post icds_url, params: { icd: { code: @icd.code, title: @icd.title } }
    end

    assert_redirected_to icd_url(Icd.last)
  end

  test "should show icd" do
    get icd_url(@icd)
    assert_response :success
  end

  test "should get edit" do
    get edit_icd_url(@icd)
    assert_response :success
  end

  test "should update icd" do
    patch icd_url(@icd), params: { icd: { code: @icd.code, title: @icd.title } }
    assert_redirected_to icd_url(@icd)
  end

  test "should destroy icd" do
    assert_difference('Icd.count', -1) do
      delete icd_url(@icd)
    end

    assert_redirected_to icds_url
  end
end
