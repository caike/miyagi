class HomeController < ApplicationController

  def index
    @description, @implementation = Description.new, Implementation.new
  end
  
end