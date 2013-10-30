class PasswordChangeForm < Form
  attr_accessor :password, :password_confirmation
  validates_presence_of :password, :password_confirmation
end
