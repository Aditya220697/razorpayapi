require "test_helper"

class FundAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fund_account = fund_accounts(:one)
  end

  test "should get index" do
    get fund_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_fund_account_url
    assert_response :success
  end

  test "should create fund_account" do
    assert_difference("FundAccount.count") do
      post fund_accounts_url, params: { fund_account: { account_number: @fund_account.account_number, account_type: @fund_account.account_type, active: @fund_account.active, bank_account: @fund_account.bank_account, contact_id: @fund_account.contact_id, entity: @fund_account.entity, ifsc: @fund_account.ifsc, name: @fund_account.name, vpa_address: @fund_account.vpa_address } }
    end

    assert_redirected_to fund_account_url(FundAccount.last)
  end

  test "should show fund_account" do
    get fund_account_url(@fund_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_fund_account_url(@fund_account)
    assert_response :success
  end

  test "should update fund_account" do
    patch fund_account_url(@fund_account), params: { fund_account: { account_number: @fund_account.account_number, account_type: @fund_account.account_type, active: @fund_account.active, bank_account: @fund_account.bank_account, contact_id: @fund_account.contact_id, entity: @fund_account.entity, ifsc: @fund_account.ifsc, name: @fund_account.name, vpa_address: @fund_account.vpa_address } }
    assert_redirected_to fund_account_url(@fund_account)
  end

  test "should destroy fund_account" do
    assert_difference("FundAccount.count", -1) do
      delete fund_account_url(@fund_account)
    end

    assert_redirected_to fund_accounts_url
  end
end
