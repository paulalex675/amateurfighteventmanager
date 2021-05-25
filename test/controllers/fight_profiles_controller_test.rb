require "test_helper"

class FightProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fight_profile = fight_profiles(:one)
  end

  test "should get index" do
    get fight_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_fight_profile_url
    assert_response :success
  end

  test "should create fight_profile" do
    assert_difference('FightProfile.count') do
      post fight_profiles_url, params: { fight_profile: { fight_weight: @fight_profile.fight_weight, gender: @fight_profile.gender, gym_id: @fight_profile.gym_id, ring_name: @fight_profile.ring_name, style: @fight_profile.style, user_id: @fight_profile.user_id } }
    end

    assert_redirected_to fight_profile_url(FightProfile.last)
  end

  test "should show fight_profile" do
    get fight_profile_url(@fight_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_fight_profile_url(@fight_profile)
    assert_response :success
  end

  test "should update fight_profile" do
    patch fight_profile_url(@fight_profile), params: { fight_profile: { fight_weight: @fight_profile.fight_weight, gender: @fight_profile.gender, gym_id: @fight_profile.gym_id, ring_name: @fight_profile.ring_name, style: @fight_profile.style, user_id: @fight_profile.user_id } }
    assert_redirected_to fight_profile_url(@fight_profile)
  end

  test "should destroy fight_profile" do
    assert_difference('FightProfile.count', -1) do
      delete fight_profile_url(@fight_profile)
    end

    assert_redirected_to fight_profiles_url
  end
end
