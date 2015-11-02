require 'httparty'
# require_relative '../../app/datasets/user_data_set'
# require_relative '../../app/models/user'

class UserService
  include HTTParty
  include RestHelper

  base_uri "#{RestHelper.rest_root_url}"
  default_timeout 3
  logger Rails.logger

  def initialize(user, password)
    @auth = {username: user, password: password}
  end

  def find(options = {})
    options.merge!({basic_auth: @auth})
    catch_exceptions do
      self.class.get('/users', options)
    end
  end
end


# user_service = UserService.new('laurensvdb', '1')
#
# response = user_service.find(query: { LoginName: 'laurensvdb'})
#
# puts "response code = #{response.code}"
#
# puts "response = #{response.inspect}"
#
# user_data_set = UserDataSet.new(response)
#
# laurens = User.new(user_data_set.tt_user)
#
# puts laurens.inspect