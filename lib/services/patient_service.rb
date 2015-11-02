require 'httparty'

class PatientService
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
      self.class.get('/patients', options)
    end
  end

  def find_by_id(id, options = {})
    options.merge!({basic_auth: @auth})
    catch_exceptions do
      self.class.get("/patients/#{id}/personmedicalrecord", options)
    end
  end
end