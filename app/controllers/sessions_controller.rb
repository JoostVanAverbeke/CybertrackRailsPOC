class SessionsController < ApplicationController
  def new
  end

  def create
    user_service = UserService.new(params[:login], params[:password])
    response = user_service.find(query: { LoginName: params[:login]})
    if response.code == 200
      login_user = UserDataSet.new(response).users.first
      session[:user] = { login: params[:login], password: params[:password], locale: params[:language] }
      I18n.locale = params[:language] if params[:language]
      redirect_to root_url, :notice => I18n.t('signin.sessions.logged_in')
    else
      flash.now.alert = I18n.t('signin.failure.not_found_in_application')
      render 'new'
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_url, :notice => I18n.t('signin.sessions.logged_out')
  end
end