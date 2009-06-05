require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "one description and implementation" do
    get :index
    assert assigns(:description), "does not have a description (a test class)"
    assert assigns(:implementation), "does not have an implementation"
    assert_tag :tag => "div", :attributes => { :id => "dojo_instructions" }
  end
  
    
end