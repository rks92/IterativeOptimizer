require 'test_helper'

class WeeklyGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_goal = weekly_goals(:one)
  end

  test "should get index" do
    get weekly_goals_url
    assert_response :success
  end

  test "should get new" do
    get new_weekly_goal_url
    assert_response :success
  end

  test "should create weekly_goal" do
    assert_difference('WeeklyGoal.count') do
      post weekly_goals_url, params: { weekly_goal: { actual_time_min: @weekly_goal.actual_time_min, app_id_id: @weekly_goal.app_id_id, begin_date: @weekly_goal.begin_date, category_id_id: @weekly_goal.category_id_id, days_goal_completed: @weekly_goal.days_goal_completed, end_date: @weekly_goal.end_date, fault_tolerance: @weekly_goal.fault_tolerance, momentum: @weekly_goal.momentum, successful: @weekly_goal.successful, target_time_min: @weekly_goal.target_time_min } }
    end

    assert_redirected_to weekly_goal_url(WeeklyGoal.last)
  end

  test "should show weekly_goal" do
    get weekly_goal_url(@weekly_goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_weekly_goal_url(@weekly_goal)
    assert_response :success
  end

  test "should update weekly_goal" do
    patch weekly_goal_url(@weekly_goal), params: { weekly_goal: { actual_time_min: @weekly_goal.actual_time_min, app_id_id: @weekly_goal.app_id_id, begin_date: @weekly_goal.begin_date, category_id_id: @weekly_goal.category_id_id, days_goal_completed: @weekly_goal.days_goal_completed, end_date: @weekly_goal.end_date, fault_tolerance: @weekly_goal.fault_tolerance, momentum: @weekly_goal.momentum, successful: @weekly_goal.successful, target_time_min: @weekly_goal.target_time_min } }
    assert_redirected_to weekly_goal_url(@weekly_goal)
  end

  test "should destroy weekly_goal" do
    assert_difference('WeeklyGoal.count', -1) do
      delete weekly_goal_url(@weekly_goal)
    end

    assert_redirected_to weekly_goals_url
  end
end
