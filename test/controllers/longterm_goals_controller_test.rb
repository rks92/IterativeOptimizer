require 'test_helper'

class LongtermGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @longterm_goal = longterm_goals(:one)
  end

  test "should get index" do
    get longterm_goals_url
    assert_response :success
  end

  test "should get new" do
    get new_longterm_goal_url
    assert_response :success
  end

  test "should create longterm_goal" do
    assert_difference('LongtermGoal.count') do
      post longterm_goals_url, params: { longterm_goal: { actual_time_min: @longterm_goal.actual_time_min, category_id: @longterm_goal.category_id, successful: @longterm_goal.successful, target_time_min: @longterm_goal.target_time_min } }
    end

    assert_redirected_to longterm_goal_url(LongtermGoal.last)
  end

  test "should show longterm_goal" do
    get longterm_goal_url(@longterm_goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_longterm_goal_url(@longterm_goal)
    assert_response :success
  end

  test "should update longterm_goal" do
    patch longterm_goal_url(@longterm_goal), params: { longterm_goal: { actual_time_min: @longterm_goal.actual_time_min, category_id: @longterm_goal.category_id, successful: @longterm_goal.successful, target_time_min: @longterm_goal.target_time_min } }
    assert_redirected_to longterm_goal_url(@longterm_goal)
  end

  test "should destroy longterm_goal" do
    assert_difference('LongtermGoal.count', -1) do
      delete longterm_goal_url(@longterm_goal)
    end

    assert_redirected_to longterm_goals_url
  end
end
