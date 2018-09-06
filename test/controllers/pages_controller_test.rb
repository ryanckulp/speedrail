require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "should get home" do
    get :home
    assert_response :success
  end

end
