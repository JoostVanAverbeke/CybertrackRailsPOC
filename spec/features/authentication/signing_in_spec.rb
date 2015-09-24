require 'rails_helper'


feature 'Signing in' do
  let(:login) { 'Login'}
  let(:password) { 'Password'}
  let(:do_login) { 'Log in'}
  let(:signed_in) { 'Logged in successfully.'}
  let(:login_failure) { 'Invalid login or password.'}

  feature 'Successful sign in' do

    let(:user_bar) {
      {"usr_Id"=>65, "usr_LoginName"=>"bar", "usr_FirstName"=>"Bar", "usr_LastName"=>"Doe", "usr_Initials"=>"BD"}
    }
    let (:tt_user) {
      {"tt_User"=>[ user_bar ] }
    }

    let (:ds_users) {
      { "dsUsers"=> tt_user }
    }

    before :each do
      allow_any_instance_of(UserService).to receive(:find).and_return(build_httparty_response(ds_users))
    end

    scenario 'Successful sign in via form' do
      visit '/'
      fill_in login, with: 'laurensvdb'
      fill_in password, with: '1'
      click_button do_login
      expect(page).to have_content(signed_in)
    end

    scenario 'Successful sign in and specifying the language via form' do
      visit '/'
      fill_in login, with: 'john'
      fill_in password, with: '1234_password'
      select 'Flemish', from: :language
      click_button do_login
      expect(page).to have_content('Succesvol ingelogd.')
    end

  end

  feature 'Unsuccessful sign in' do

    before :each do
      allow_any_instance_of(UserService).to receive(:find).and_return(build_httparty_response({}, 401))
    end

    scenario 'Unsuccessful sign in via form due to invalid password' do
      visit '/'
      fill_in login, with: 'laurensvdb'
      fill_in password, with: '2'
      click_button do_login
      expect(page).to have_content(login_failure)
    end

    scenario 'Unsuccessful sign in via form due to not specifying password' do
      visit '/'
      fill_in login, with: 'laurensvdb'
      click_button do_login
      expect(page).to have_content(login_failure)
    end

    scenario 'Unsuccessful sign in via form due to invalid login' do
      visit '/'
      fill_in login, with: 'john.doe@hotmail.com'
      fill_in password, with: '1234_password'
      click_button do_login
      expect(page).to have_content(login_failure)
    end
  end

end