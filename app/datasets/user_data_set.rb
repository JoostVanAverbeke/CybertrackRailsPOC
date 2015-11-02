require 'httparty'
require 'httparty_response'

class UserDataSet
  include HTTPartyResponse

  attr_reader :users

  def self.parse(httparty_response)
    users = []
    if httparty_response.code == 200
      self.tt_user(httparty_response).each {
          |user_hash| users << User.new(user_hash)
      }
    end
    self.new(users)
  end

  def initialize(users)
    @users = users
  end

  def tt_user
    { 'tt_User' => @users }
  end

  def ds_user
    { 'dsUsers' => tt_user }
  end

  private

  def self.tt_user(httparty_response)
    tt_user = []
    tt_user = self.ds_users(httparty_response)['tt_User'] if self.ds_users(httparty_response)
  end

  def self.ds_users(httparty_response)
    httparty_response['dsUsers']
  end
end