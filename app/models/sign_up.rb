class SignUp < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def name 
    self.user.full_name
  end

  def matched
    self.matched? == true
  end  
end
