class SessionForm < Form
  attr_accessor :identifier, :password
  validates_presence_of :identifier, :password
end
