require "application_system_test_case"

class PayoutsTest < ApplicationSystemTestCase
  setup do
    @payout = payouts(:one)
  end

  test "visiting the index" do
    visit payouts_url
    assert_selector "h1", text: "Payouts"
  end

  test "should create payout" do
    visit payouts_url
    click_on "New payout"

    fill_in "Account number", with: @payout.account_number
    fill_in "Amount", with: @payout.amount
    fill_in "Currency", with: @payout.currency
    fill_in "Fund account", with: @payout.fund_account_id
    fill_in "Mode", with: @payout.mode
    fill_in "Purpose", with: @payout.purpose
    click_on "Create Payout"

    assert_text "Payout was successfully created"
    click_on "Back"
  end

  test "should update Payout" do
    visit payout_url(@payout)
    click_on "Edit this payout", match: :first

    fill_in "Account number", with: @payout.account_number
    fill_in "Amount", with: @payout.amount
    fill_in "Currency", with: @payout.currency
    fill_in "Fund account", with: @payout.fund_account_id
    fill_in "Mode", with: @payout.mode
    fill_in "Purpose", with: @payout.purpose
    click_on "Update Payout"

    assert_text "Payout was successfully updated"
    click_on "Back"
  end

  test "should destroy Payout" do
    visit payout_url(@payout)
    click_on "Destroy this payout", match: :first

    assert_text "Payout was successfully destroyed"
  end
end
