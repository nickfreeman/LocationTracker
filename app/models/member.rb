class Member < ActiveRecord::Base
  attr_accessible :name, :email, :role
  
  #sortin the list of members so that first click is ascending and the second click is descending
  @asc = true
  def self.asc=(val)
	@asc = val
  end
  
  def self.asc
    return @asc
  end
  
end
