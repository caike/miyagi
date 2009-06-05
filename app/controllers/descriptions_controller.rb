class DescriptionsController < ApplicationController

  def run_tests
    description = Description.new(params[:description])
    @test_result = description.run_tests
    respond_to do |format|
      format.js
    end
  end

end
