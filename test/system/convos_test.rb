require "application_system_test_case"

class ConvosTest < ApplicationSystemTestCase
  setup do
    @convo = convos(:one)
  end

  test "visiting the index" do
    visit convos_url
    assert_selector "h1", text: "Convos"
  end

  test "should create convo" do
    visit convos_url
    click_on "New convo"

    fill_in "Buyer", with: @convo.user_id
    fill_in "Post", with: @convo.post_id
    click_on "Create Convo"

    assert_text "Convo was successfully created"
    click_on "Back"
  end

  test "should update Convo" do
    visit convo_url(@convo)
    click_on "Edit this convo", match: :first

    fill_in "Buyer", with: @convo.user_id
    fill_in "Post", with: @convo.post_id
    click_on "Update Convo"

    assert_text "Convo was successfully updated"
    click_on "Back"
  end

  test "should destroy Convo" do
    visit convo_url(@convo)
    click_on "Destroy this convo", match: :first

    assert_text "Convo was successfully destroyed"
  end
end
