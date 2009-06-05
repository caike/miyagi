require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "one description and implementation" do
    get :index
    assert assigns(:description), "does not have a description (a test class)"
    assert assigns(:implementation), "does not have an implementation"
  end
  
  test "run a passing test" do        
    xhr :post, :run_tests, :description => { :code => single_test_description_code }     
    assert assigns(:test_result), "does not show test result"
    assert_equal single_test_expected_result, assigns(:test_result), "unexpected result: #{assigns(:test_result)}"
  end
  
  def single_test_description_code
    "class Teste < Test::Unit::TestCase; def test_this; assert true; end; end"
  end
  
  def single_test_expected_result
    "1 tests, 1 assertions, 0 failures, 0 errors"
  end
    
end