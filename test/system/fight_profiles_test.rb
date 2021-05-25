require "application_system_test_case"

class FightProfilesTest < ApplicationSystemTestCase
  setup do
    @fight_profile = fight_profiles(:one)
  end

  test "visiting the index" do
    visit fight_profiles_url
    assert_selector "h1", text: "Fight Profiles"
  end

  test "creating a Fight profile" do
    visit fight_profiles_url
    click_on "New Fight Profile"

    fill_in "Fight weight", with: @fight_profile.fight_weight
    fill_in "Gender", with: @fight_profile.gender
    fill_in "Gym", with: @fight_profile.gym_id
    fill_in "Ring name", with: @fight_profile.ring_name
    fill_in "Style", with: @fight_profile.style
    fill_in "User", with: @fight_profile.user_id
    click_on "Create Fight profile"

    assert_text "Fight profile was successfully created"
    click_on "Back"
  end

  test "updating a Fight profile" do
    visit fight_profiles_url
    click_on "Edit", match: :first

    fill_in "Fight weight", with: @fight_profile.fight_weight
    fill_in "Gender", with: @fight_profile.gender
    fill_in "Gym", with: @fight_profile.gym_id
    fill_in "Ring name", with: @fight_profile.ring_name
    fill_in "Style", with: @fight_profile.style
    fill_in "User", with: @fight_profile.user_id
    click_on "Update Fight profile"

    assert_text "Fight profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Fight profile" do
    visit fight_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fight profile was successfully destroyed"
  end
end
