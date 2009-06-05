class DescriptionsController < ApplicationController

  def run_tests
    implementation = params[:implementation][:code] unless params[:implementation].nil?
    @test_result = run_tests_for(params[:description][:code], implementation)
    respond_to do |format|
      format.js
    end
  end

  protected

  def run_tests_for(description, implementation)
    test_unit = '-rtest/unit'
    result = `ruby -I.:lib:test #{test_unit} -e "#{implementation} #{description}"`
    result.match(/\d tests.*/).to_s
  end

end
