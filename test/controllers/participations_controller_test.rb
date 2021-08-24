require 'test_helper'

class ParticipationsControllerTest < ActionDispatch::IntegrationTest
  test "should get hostsdashboards" do
    get participations_hostsdashboards_url
    assert_response :success
  end

end
