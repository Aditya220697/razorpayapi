require "test_helper"

class PaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pay = pays(:one)
  end

  test "should get index" do
    get pays_url
    assert_response :success
  end

  test "should get new" do
    get new_pay_url
    assert_response :success
  end

  test "should create pay" do
    assert_difference("Pay.count") do
      post pays_url, params: { pay: { contact_no: @pay.contact_no, email: @pay.email, name: @pay.name, upi_id: @pay.upi_id } }
    end

    assert_redirected_to pay_url(Pay.last)
  end

  test "should show pay" do
    get pay_url(@pay)
    assert_response :success
  end

  test "should get edit" do
    get edit_pay_url(@pay)
    assert_response :success
  end

  test "should update pay" do
    patch pay_url(@pay), params: { pay: { contact_no: @pay.contact_no, email: @pay.email, name: @pay.name, upi_id: @pay.upi_id } }
    assert_redirected_to pay_url(@pay)
  end

  test "should destroy pay" do
    assert_difference("Pay.count", -1) do
      delete pay_url(@pay)
    end

    assert_redirected_to pays_url
  end
end
