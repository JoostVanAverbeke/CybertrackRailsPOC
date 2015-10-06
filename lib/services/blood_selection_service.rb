require 'httparty'

class BloodSelectionService
  include HTTParty
  include RestHelper

  base_uri "#{RestHelper.rest_root_url}"
  default_timeout 3

  def initialize(user, password)
    @auth = {username: user, password: password}
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