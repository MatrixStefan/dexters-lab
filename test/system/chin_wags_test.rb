require "application_system_test_case"

class ChinWagsTest < ApplicationSystemTestCase
  setup do
    @chin_wag = chin_wags(:one)
  end

  test "visiting the index" do
    visit chin_wags_url
    assert_selector "h1", text: "Chin Wags"
  end

  test "creating a Chin wag" do
    visit chin_wags_url
    click_on "New Chin Wag"

    fill_in "Message", with: @chin_wag.message
    fill_in "Text", with: @chin_wag.text
    click_on "Create Chin wag"

    assert_text "Chin wag was successfully created"
    click_on "Back"
  end

  test "updating a Chin wag" do
    visit chin_wags_url
    click_on "Edit", match: :first

    fill_in "Message", with: @chin_wag.message
    fill_in "Text", with: @chin_wag.text
    click_on "Update Chin wag"

    assert_text "Chin wag was successfully updated"
    click_on "Back"
  end

  test "destroying a Chin wag" do
    visit chin_wags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chin wag was successfully destroyed"
  end
end
