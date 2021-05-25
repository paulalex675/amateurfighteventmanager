require "test_helper"

class FightRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fight_record = fight_records(:one)
  end

  test "should get index" do
    get fight_records_url
    assert_response :success
  end

  test "should get new" do
    get new_fight_record_url
    assert_response :success
  end

  test "should create fight_record" do
    assert_difference('FightRecord.count') do
      post fight_records_url, params: { fight_record: { draw: @fight_record.draw, lose: @fight_record.lose, style: @fight_record.style, user_id: @fight_record.user_id, win: @fight_record.win } }
    end

    assert_redirected_to fight_record_url(FightRecord.last)
  end

  test "should show fight_record" do
    get fight_record_url(@fight_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_fight_record_url(@fight_record)
    assert_response :success
  end

  test "should update fight_record" do
    patch fight_record_url(@fight_record), params: { fight_record: { draw: @fight_record.draw, lose: @fight_record.lose, style: @fight_record.style, user_id: @fight_record.user_id, win: @fight_record.win } }
    assert_redirected_to fight_record_url(@fight_record)
  end

  test "should destroy fight_record" do
    assert_difference('FightRecord.count', -1) do
      delete fight_record_url(@fight_record)
    end

    assert_redirected_to fight_records_url
  end
end
