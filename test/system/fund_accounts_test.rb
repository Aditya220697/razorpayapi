require "application_system_test_case"

class FundAccountsTest < ApplicationSystemTestCase
  setup do
    @fund_account = fund_accounts(:one)
  end

  test "visiting the index" do
    visit fund_accounts_url
    assert_selector "h1", text: "Fund accounts"
  end

  test "should create fund account" do
    visit fund_accounts_url
    click_on "New fund account"

    fill_in "Account number", with: @fund_account.account_number
    fill_in "Account type", with: @fund_account.account_type
    check "Active" if @fund_account.active
    fill_in "Bank account", with: @fund_account.bank_account
    fill_in "Contact", with: @fund_account.contact_id
    fill_in "Entity", with: @fund_account.entity
    fill_in "Ifsc", with: @fund_account.ifsc
    fill_in "Name", with: @fund_account.name
    fill_in "Vpa address", with: @fund_account.vpa_address
    click_on "Create Fund account"

    assert_text "Fund account was successfully created"
    click_on "Back"
  end

  test "should update Fund account" do
    visit fund_account_url(@fund_account)
    click_on "Edit this fund account", match: :first

    fill_in "Account number", with: @fund_account.account_number
    fill_in "Account type", with: @fund_account.account_type
    check "Active" if @fund_account.active
    fill_in "Bank account", with: @fund_account.bank_account
    fill_in "Contact", with: @fund_account.contact_id
    fill_in "Entity", with: @fund_account.entity
    fill_in "Ifsc", with: @fund_account.ifsc
    fill_in "Name", with: @fund_account.name
    fill_in "Vpa address", with: @fund_account.vpa_address
    click_on "Update Fund account"

    assert_text "Fund account was successfully updated"
    click_on "Back"
  end

  test "should destroy Fund account" do
    visit fund_account_url(@fund_account)
    click_on "Destroy this fund account", match: :first

    assert_text "Fund account was successfully destroyed"
  end
end
