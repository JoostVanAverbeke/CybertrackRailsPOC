class User
  attr_accessor :usr_Id, :usr_LoginName, :usr_FirstName, :usr_LastName, :usr_Initials, :password

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end