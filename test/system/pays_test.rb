require "application_system_test_case"

class PaysTest < ApplicationSystemTestCase
  setup do
    @pay = pays(:one)
  end

  test "visiting the index" do
    visit pays_url
    assert_selector "h1", text: "Pays"
  end

  test "should create pay" do
    visit pays_url
    click_on "New pay"

    fill_in "Contact no", with: @pay.contact_no
    fill_in "Email", with: @pay.email
    fill_in "Name", with: @pay.name
    fill_in "Upi", with: @pay.upi_id
    click_on "Create Pay"

    assert_text "Pay was successfully created"
    click_on "Back"
  end

  test "should update Pay" do
    visit pay_url(@pay)
    click_on "Edit this pay", match: :first

    fill_in "Contact no", with: @pay.contact_no
    fill_in "Email", with: @pay.email
    fill_in "Name", with: @pay.name
    fill_in "Upi", with: @pay.upi_id
    click_on "Update Pay"

    assert_text "Pay was successfully updated"
    click_on "Back"
  end

  test "should destroy Pay" do
    visit pay_url(@pay)
    click_on "Destroy this pay", match: :first

    assert_text "Pay was successfully destroyed"
  end
end
