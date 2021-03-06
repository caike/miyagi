class HomeController < ApplicationController

  def index
    @description = Description.new
  end
  
  def start_dojo
    @description = Description.new(params[:description])
    @description.implementation_code = initial_implementation_code(@description.name)
    @description.test_code = initial_test_code(@description.name)
    respond_to do |f|
      f.js
    end
  end
  
  protected
  
  def initial_implementation_code(name)
    "class #{name}
end"
  end
  
  def initial_test_code(name)
    "class #{name}Test < Test::Unit::TestCase
  def test_true
    assert true
  end
end"
  end
  
end