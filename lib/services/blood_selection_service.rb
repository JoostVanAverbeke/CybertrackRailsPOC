require 'httparty'

class BloodSelectionService
  include HTTParty
  include RestHelper

  base_uri "#{RestHelper.rest_root_url}"
  default_timeout 3
  logger Rails.logger
  debug_output $stderr if Rails.env.development?

  def initialize(user, password)
    @auth = create_auth_hash(user, password)
  end

  def patients(options = {})
    options.merge!({basic_auth: @auth})
    catch_exceptions do
      self.class.get('/bloodselections/patients', options)
    end
  end

  def blood_selections(patient_id, options = {})
    options.merge!({basic_auth: @auth})
    catch_exceptions do
      self.class.get("/patients/#{patient_id}/bloodselections", options)
    end
  end
end