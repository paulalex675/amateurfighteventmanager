require "application_system_test_case"

class FightRecordsTest < ApplicationSystemTestCase
  setup do
    @fight_record = fight_records(:one)
  end

  test "visiting the index" do
    visit fight_records_url
    assert_selector "h1", text: "Fight Records"
  end

  test "creating a Fight record" do
    visit fight_records_url
    click_on "New Fight Record"

    fill_in "Draw", with: @fight_record.draw
    fill_in "Lose", with: @fight_record.lose
    fill_in "Style", with: @fight_record.style
    fill_in "User", with: @fight_record.user_id
    fill_in "Win", with: @fight_record.win
    click_on "Create Fight record"

    assert_text "Fight record was successfully created"
    click_on "Back"
  end

  test "updating a Fight record" do
    visit fight_records_url
    click_on "Edit", match: :first

    fill_in "Draw", with: @fight_record.draw
    fill_in "Lose", with: @fight_record.lose
    fill_in "Style", with: @fight_record.style
    fill_in "User", with: @fight_record.user_id
    fill_in "Win", with: @fight_record.win
    click_on "Update Fight record"

    assert_text "Fight record was successfully updated"
    click_on "Back"
  end

  test "destroying a Fight record" do
    visit fight_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fight record was successfully destroyed"
  end
end
