module RestHelper

  def self.rest_root_url
    Rails.application.config_for(:config)['rest_service']['root_url']
  end

end