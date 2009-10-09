require 'test_helper'
class GeneratorTest < ActionController::IntegrationTest 
  
  def setup
    FileUtils.rm_f 'test/app_root/public/styledobjects/test/_foo\:test/_bar\:test2/_boom.css.css'
    get styledobject_path('test/_foo:test/_bar:test2/_boom.css')
  end
  
  def test_response
    assert_response :success
    assert_equal 'text/css; charset=utf-8', @response.headers['Content-Type']
  end

  
  def test_content
    assert_equal '.so-test-foo { background-color: yellow; }.so-test-bar body { width: 100%; }', @response.body.gsub(/\n/, '')
  end
  
#  test "truth" do
#    assert true
#  end
end
