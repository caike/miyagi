require 'test_helper'

class DescriptionsControllerTest < ActionController::TestCase

  test "run a stand-alone passing description (test)" do        
    xhr :post, :run_tests, :description => { :test_code => single_test_test_code }     
    assert assigns(:test_result), "does not show test result"
    assert_equal single_test_expected_result, assigns(:test_result), "unexpected result: #{assigns(:test_result)}"
  end
  
  test "run a passing description (test) with implementation"  do
    xhr :post, :run_tests, :description => { :test_code => test_code, :implementation_code => implementation_code }
    assert assigns(:test_result), "does not show test result"
    assert_equal single_test_expected_result, assigns(:test_result), "unexpected result: #{assigns(:test_result)}"
  end
  
  test "implementation without ending semi-colon"  do
    xhr :post, :run_tests, :description => { :test_code => test_code, :implementation_code =>  "class Instrument; end" }
    assert assigns(:test_result), "does not show test result"
    assert_equal single_test_expected_result, assigns(:test_result), "unexpected result: #{assigns(:test_result)}"
  end
  
  
  protected

  def single_test_test_code
    "class Teste < Test::Unit::TestCase; def test_this; assert true; end; end"
  end

  def single_test_expected_result
    "1 tests, 1 assertions, 0 failures, 0 errors"
  end
  
  def test_code
    "class InstrumentTest < Test::Unit::TestCase; def test_new_instrument; guitar = Instrument.new; assert guitar; end; end"
  end
  
  def implementation_code
    "class Instrument; end;"
  end     
  
end