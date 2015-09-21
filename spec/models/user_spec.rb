require 'rails_helper'

describe User do
  let(:user) { User.new({"usr_Id"=>65, "usr_LoginName"=>"bar", "usr_FirstName"=>"Bar", "usr_LastName"=>"Doe", "usr_Initials"=>"BD"})}

  it 'constructs an instance from a hash' do
    expect(user).not_to be_nil
  end

  it 'has a usr_LoginName attribute' do
    expect(user.usr_LoginName).to eq('bar')
  end

  it 'has a usr_FirstName attribute' do
    expect(user.usr_FirstName).to eq('Bar')
  end

  it 'has a usr_LastName attribute' do
    expect(user.usr_LastName).to eq('Doe')
  end

  it 'has a usr_Initials attribute' do
    expect(user.usr_Initials).to eq('BD')
  end
end