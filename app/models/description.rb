class Description < ActiveRecord::Base
 
   
  def run_tests
    unless self.implementation_code.nil?
      self.implementation_code = self.implementation_code.concat(';') unless self.implementation_code[-1] == ';'
    end
    test_unit = '-rtest/unit'
    result = `ruby -I.:lib:test #{test_unit} -e "#{self.implementation_code} #{self.test_code}"`
    result.match(/\d tests.*/).to_s
  end
  
  
end