require 'rails_helper'

describe UserDataSet do
  let(:user_bar) {
    {"usr_Id"=>65, "usr_LoginName"=>"bar", "usr_FirstName"=>"Bar", "usr_LastName"=>"Doe", "usr_Initials"=>"BD"}
  }
  let (:tt_user) {
    {"tt_User"=>[ user_bar ] }
  }

  let (:ds_users) {
    { "dsUsers"=> tt_user }
  }

  let(:user_data_set) { UserDataSet.parse(build_httparty_response(ds_users))}

  it 'returns \'dsUsers\' hash  of this data set' do
    expect(user_data_set.ds_user).not_to be_nil
    expect(user_data_set.ds_user['dsUsers']).not_to be_nil
  end

  it 'returns the \'tt_User\' hash of this data set' do
    expect(user_data_set.tt_user).not_to be_nil
    expect(user_data_set.tt_user['tt_User']).not_to be_nil
    expect(user_data_set.tt_user['tt_User'].length).to eq(1)
    expect(user_data_set.tt_user['tt_User'][0]).to be_an_instance_of(User)
  end

  it 'returns an array of User model instances constructed from the json items in tt_User' do
    expect(user_data_set.users).not_to be_nil
    expect(user_data_set.users.length).to eq(1)
    expect(user_data_set.users[0]).to be_an_instance_of(User)
  end
end