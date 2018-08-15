require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = records(:one)
  end

  test "should get index" do
    get records_url
    assert_response :success
  end

  test "should get new" do
    get new_record_url
    assert_response :success
  end

  test "should create record" do
    assert_difference('Record.count') do
      post records_url, params: { record: { address: @record.address, blood_pressure: @record.blood_pressure, complaints: @record.complaints, department: @record.department, diagnosis: @record.diagnosis, doctor_name: @record.doctor_name, doctor_update_time: @record.doctor_update_time, doctor_updated: @record.doctor_updated, drugs_given: @record.drugs_given, front_desk_name: @record.front_desk_name, front_desk_updated: @record.front_desk_updated, gender: @record.gender, health_care_provider: @record.health_care_provider, height: @record.height, months: @record.months, name: @record.name, nurse_name: @record.nurse_name, nurse_update_time: @record.nurse_update_time, nurse_updated: @record.nurse_updated, pharmacist_name: @record.pharmacist_name, pharmacist_update_time: @record.pharmacist_update_time, pharmarcist_updated: @record.pharmarcist_updated, temperature: @record.temperature, treatment: @record.treatment, weight: @record.weight, years: @record.years } }
    end

    assert_redirected_to record_url(Record.last)
  end

  test "should show record" do
    get record_url(@record)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_url(@record)
    assert_response :success
  end

  test "should update record" do
    patch record_url(@record), params: { record: { address: @record.address, blood_pressure: @record.blood_pressure, complaints: @record.complaints, department: @record.department, diagnosis: @record.diagnosis, doctor_name: @record.doctor_name, doctor_update_time: @record.doctor_update_time, doctor_updated: @record.doctor_updated, drugs_given: @record.drugs_given, front_desk_name: @record.front_desk_name, front_desk_updated: @record.front_desk_updated, gender: @record.gender, health_care_provider: @record.health_care_provider, height: @record.height, months: @record.months, name: @record.name, nurse_name: @record.nurse_name, nurse_update_time: @record.nurse_update_time, nurse_updated: @record.nurse_updated, pharmacist_name: @record.pharmacist_name, pharmacist_update_time: @record.pharmacist_update_time, pharmarcist_updated: @record.pharmarcist_updated, temperature: @record.temperature, treatment: @record.treatment, weight: @record.weight, years: @record.years } }
    assert_redirected_to record_url(@record)
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete record_url(@record)
    end

    assert_redirected_to records_url
  end
end
