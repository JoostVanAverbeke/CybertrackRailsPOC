require 'remote_rest_error'
require 'httparty'

module RestHelper

  def self.rest_root_url
    Rails.application.config_for(:config)['rest_service']['root_url']
  end

  def catch_exceptions
    begin
      yield
    rescue HTTParty::Error, StandardError => error
      raise RemoteRestError.new error.message
    end
  end

end