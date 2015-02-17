require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get indez" do
    get :indez
    assert_response :success
  end

end
