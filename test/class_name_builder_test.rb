require 'test_helper'
class ClassNameBuilderTest < ActionController::TestCase
  
  def test_starts_with_so
    assert_equal 'so-', StyledObjects::ClassNameBuilder.build_class_name_from_partial_path('foo')[0..2], 'class name does not start with "so-"'
  end

  def test_path_translation
    assert_equal 'so-foo-bar-xpto', StyledObjects::ClassNameBuilder.build_class_name_from_partial_path('foo/bar/_xpto')
  end

  def test_path_without_extension
    assert_equal 'so-foo-bar-xpto', StyledObjects::ClassNameBuilder.build_class_name_from_partial_path('foo/bar/_xpto.css')
  end

#  test "truth" do
#    assert true
#  end
end
