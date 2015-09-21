module HTTPartyResponse
  def http_ok?
    response.code == 200
  end
end