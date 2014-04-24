module FacebookApiModule
  # basic http lib usage http://www.rubyinside.com/nethttp-cheat-sheet-2940.html
  EXTENSION_APP_ID = ENV["EXTENSION_APP_ID"];
  GRAPH_API_URL = "https://graph.facebook.com/";
  def self.get_app_info(accessToken)
    graphApi = URI.parse(GRAPH_API_URL + "app?access_token=" + accessToken);
    Net::HTTP.get_print(graphApi);
    return Net::HTTP.get_response(graphApi);
  end
  def self.get_user_info(accessToken)
    graphApi = URI.parse(GRAPH_API_URL + "me?access_token=" + accessToken);
    Net::HTTP.get_print(graphApi);
    return Net::HTTP.get_response(graphApi);
  end

end
