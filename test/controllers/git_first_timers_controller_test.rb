require 'test_helper'

class GitFirstTimersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @git_first_timer = git_first_timers(:one)
  end

  test "should get index" do
    get git_first_timers_url
    assert_response :success
  end

  test "should get new" do
    get new_git_first_timer_url
    assert_response :success
  end

  test "should create git_first_timer" do
    assert_difference('GitFirstTimer.count') do
      post git_first_timers_url, params: { git_first_timer: {  } }
    end

    assert_redirected_to git_first_timer_url(GitFirstTimer.last)
  end

  test "should show git_first_timer" do
    get git_first_timer_url(@git_first_timer)
    assert_response :success
  end

  test "should get edit" do
    get edit_git_first_timer_url(@git_first_timer)
    assert_response :success
  end

  test "should update git_first_timer" do
    patch git_first_timer_url(@git_first_timer), params: { git_first_timer: {  } }
    assert_redirected_to git_first_timer_url(@git_first_timer)
  end

  test "should destroy git_first_timer" do
    assert_difference('GitFirstTimer.count', -1) do
      delete git_first_timer_url(@git_first_timer)
    end

    assert_redirected_to git_first_timers_url
  end
end
