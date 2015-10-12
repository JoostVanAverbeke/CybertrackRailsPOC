class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :build_menu, :set_session_locale, :prepare_for_mobile
  rescue_from RemoteRestError, with: :remote_rest_service_not_available

  protected
  def build_menu
    @menu ||= YAML.load(ERB.new(File.read("#{Rails.root}/config/menu/cybertrack.menu.yml.erb")).result)
  end

  def basic_auth_credentials
    @http_basic_authorization = basic_http_encode(session[:user]['login'], session[:user]['password']) if current_user?
  end

  def set_session_locale
    I18n.locale = (current_user? && session[:user]['locale'] ? session[:user]['locale'] : I18n.default_locale)
  end

  private
  def current_user
    @current_user ||= find_user(session[:user]['login'], session[:user]['password']) if session[:user]
  end

  def current_user?
    !current_user.nil?
  end

  def session_login_user
    session[:user]['login'] if current_user?
  end

  def session_password_user
    session[:user]['password'] if current_user?
  end

  def authenticate_user!
    if current_user.nil?
      flash[:error] = "You need to login before continuing."
      redirect_to login_url
    end
  end

  def basic_http_encode(login, password)
    basic = ActionController::HttpAuthentication::Basic
    credentials = basic.encode_credentials(login, password)
  end

  def find_user(login, password)
    user_service = UserService.new(login, password)
    response = user_service.find(query: { LoginName: login})
    user = User.new(UserDataSet.new(response).tt_user[0]) if response.code == 200
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def prepare_for_mobile
    # If mobile and extension is .pdf e.g. patients/1.pdf => then don't treat as mobile
    unless request.format.eql?(Mime::PDF)
      session[:mobile_param] = params[:mobile] if params[:mobile]
      request.format = mobile_request_format if mobile_device?
    end
  end

  def mobile_request_format
    kendo_ui = false
    if kendo_ui
      :mkendo
    else
      :mobile
    end
  end

  def remote_rest_service_not_available
    render plain: "Remote REST Service not available", status: :service_unavailable
  end

  helper_method :current_user, :current_user?, :authenticate_user!, :set_session_locale,
                :mobile_device?, :session_login_user, :session_password_user
end
