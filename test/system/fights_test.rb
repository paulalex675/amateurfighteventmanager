require "application_system_test_case"

class FightsTest < ApplicationSystemTestCase
  setup do
    @fight = fights(:one)
  end

  test "visiting the index" do
    visit fights_url
    assert_selector "h1", text: "Fights"
  end

  test "creating a Fight" do
    visit fights_url
    click_on "New Fight"

    check "Draw" if @fight.draw
    fill_in "Event", with: @fight.event_id
    fill_in "Fighter a", with: @fight.fighter_a_id
    fill_in "Fighter b", with: @fight.fighter_b_id
    fill_in "Info", with: @fight.info
    fill_in "Result", with: @fight.result
    fill_in "Style", with: @fight.style
    fill_in "Weight", with: @fight.weight
    fill_in "Winner", with: @fight.winner
    click_on "Create Fight"

    assert_text "Fight was successfully created"
    click_on "Back"
  end

  test "updating a Fight" do
    visit fights_url
    click_on "Edit", match: :first

    check "Draw" if @fight.draw
    fill_in "Event", with: @fight.event_id
    fill_in "Fighter a", with: @fight.fighter_a_id
    fill_in "Fighter b", with: @fight.fighter_b_id
    fill_in "Info", with: @fight.info
    fill_in "Result", with: @fight.result
    fill_in "Style", with: @fight.style
    fill_in "Weight", with: @fight.weight
    fill_in "Winner", with: @fight.winner
    click_on "Update Fight"

    assert_text "Fight was successfully updated"
    click_on "Back"
  end

  test "destroying a Fight" do
    visit fights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fight was successfully destroyed"
  end
end
