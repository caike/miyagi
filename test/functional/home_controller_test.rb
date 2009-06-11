require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "one description and implementation" do
    get :index
    assert assigns(:description), "does not have a description (a test class)"
    assert_tag :tag => "div", :attributes => { :id => "dojo_instructions" }
  end
  
  test "start dojo" do
    name = "Instrument"
    xhr :post, :start_dojo, :description => { :name => name }
    assert assigns(:description), "does not have a description"    
    assert_equal name, assigns(:description).name
  end
  
  test "initial classes" do
    name = "Instrument"
    xhr :post, :start_dojo, :description => { :name => name }
    assert_equal implementation_code, assigns(:description).implementation_code, "implementation code is not set"
    assert_equal test_code, assigns(:description).test_code, "description code is not set"
  end
  
  protected
  
  def implementation_code
    'class Instrument
end'
  end
  
  def test_code
    'class InstrumentTest < Test::Unit::TestCase
  def test_true
    assert true
  end
end'
  end  
     
end