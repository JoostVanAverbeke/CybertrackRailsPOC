require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
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
    # Stub the find UserService instance method
   allow_any_instance_of(UserService).to receive(:find).and_return(build_httparty_response(ds_users))
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    subject { post :create, { login: 'bar', password: '1', language: 'nl-BE'}}
    it "redirects to the root_url" do
      expect(subject).to redirect_to(root_url)
    end
    it "stores a hash containing the login, password and the locale in the session[:user]" do
      subject
      expect(session[:user]).to eq({ login: 'bar', password: '1', locale: 'nl-BE'})
    end
  end

  describe "GET #destroy" do
    subject { get :destroy }
    it "redirects to the root_url" do
      expect(subject).to redirect_to(root_url)
    end

    it "sets the session[:user] back to nil" do
      subject
      expect(session[:user]).to be_nil
    end
  end

end
