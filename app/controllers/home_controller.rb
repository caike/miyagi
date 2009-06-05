class HomeController < ApplicationController

  def index
    @description, @implementation = Description.new, Implementation.new
  end
  
  def run_tests
    @test_result = run_tests_for(params[:description][:code])
    respond_to do |format|
      format.js
    end
  end
  
  protected
  
  def run_tests_for(code)
    result = `ruby -I.:lib:test -e "require 'test/unit'; #{code}"`
    result.match(/\d tests.*/).to_s
  end

end
