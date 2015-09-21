require 'httparty'
require 'httparty_response'

class UserDataSet
  include HTTPartyResponse

  attr_reader :response

  def initialize(httparty_response)
    @response = httparty_response
  end

  def tt_user
    ds_user['tt_User'] if http_ok?
  end

  def ds_user
    @response['dsUsers'] if http_ok?
  end

  def users
    if http_ok?
      users = []
      tt_user.each { |user_hash| users << User.new(user_hash) }
      users
    end
  end
end