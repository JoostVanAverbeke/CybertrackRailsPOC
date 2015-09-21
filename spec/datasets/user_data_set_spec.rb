require 'rails_helper'

describe UserDataSet do
  let(:response) {
    {
        "dsUsers"=> {
            "tt_User"=>[
                {"usr_Id"=>65, "usr_LoginName"=>"bar", "usr_FirstName"=>"Bar", "usr_LastName"=>"Doe", "usr_Initials"=>"BD"}
            ]
        }
    }
  }
  let(:user_data_set) { UserDataSet.new(build_httparty_response(response))}

  it 'returns \'dsUsers\' sub element from the httparty response' do
    expect(user_data_set.ds_user).to eq({
                                             "tt_User"=>[
                                                 {"usr_Id"=>65, "usr_LoginName"=>"bar", "usr_FirstName"=>"Bar", "usr_LastName"=>"Doe", "usr_Initials"=>"BD"}
                                             ]
                                         })
  end

  it 'returns the \'tt_User\' sub element from the httparty response' do
    expect(user_data_set.tt_user[0]).to eq({"usr_Id"=>65, "usr_LoginName"=>"bar", "usr_FirstName"=>"Bar", "usr_LastName"=>"Doe", "usr_Initials"=>"BD"})
  end

  it 'returns an array of User model instances constructed from the json items in tt_User' do
    expect(user_data_set.users).not_to be_nil
    expect(user_data_set.users.length).to eq(1)
    expect(user_data_set.users[0]).to be_an_instance_of(User)
  end
end