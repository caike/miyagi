require 'test_helper'

class DescriptionTest < ActiveSupport::TestCase
  
  test "belongs to an implementation" do
    assoc = Description.reflect_on_association(:implementation)
    assert_equal :belongs_to, assoc.macro, "doest not belong to implementation"
  end
  
  
end
