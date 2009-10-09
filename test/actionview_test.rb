require 'test_helper'
class ActionviewTest < ActionController::IntegrationTest 
  
  def setup
    get '/'
  end
  
  def test_response
    assert_response :success
#    assert_equal 'rurumba', @response.body
  end

#  test "truth" do
#    assert true
#  end
end
