require 'test_helper'

class SplashControllerTest < ActionDispatch::IntegrationTest
  test 'should get Users' do
    get splash_Users_url
    assert_response :success
  end

  test 'should get Sessions' do
    get splash_Sessions_url
    assert_response :success
  end
end
