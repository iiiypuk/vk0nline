require "json"
require "crest"

# TODO: Write documentation for `Src`
module Src
  VERSION = "0.1.0"

  json = File.open("config.json") do |file|
    JSON.parse(file)
  end

  # TODO: Get accessToken
  if json["accessToken"] == nil
    puts "Get accessToken"

    token_url = "https://oauth.vk.com/authorize?client_id=#{json["appID"].as_i}&redirect_uri=vk.com&response_type=token&display=mobile&v=5.131&revoke=1&state=01010&scope=offline"

    puts token_url

    puts "Open this page, and save token to config.json"
  else
    # TODO: If return 1 == COMPLETE
    response = Crest.get(
      "https://api.vk.com/method/account.setOnline",
      params: { :voip => "0", :v => "5.131",
        :access_token => json["accessToken"].as_s,
        :user_ids => json["userIds"].as_i }
    )

     status = JSON.parse(response.body)

     if status["response"] == 1
      puts "Complete!"
     end
  end
end
