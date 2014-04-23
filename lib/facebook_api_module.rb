module FacebookApiModule
  # basic http lib usage http://www.rubyinside.com/nethttp-cheat-sheet-2940.html
  EXTENSION_APP_ID = ENV["EXTENSION_APP_ID"];
  GRAPH_API_URL = "https://graph.facebook.com/";
  def self.IsExtensionTokenValid(token)
    graphApi = URI.parse(GRAPH_API_URL + "app?access_token=" + token);
    Net::HTTP.get_print(graphApi);
    response = Net::HTTP.get_response(graphApi);
  end
end
