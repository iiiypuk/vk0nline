require "json"
require "crest"

begin # JSON::ParseException
  json = File.open("config.json") do |file|
    JSON.parse(file)
  end
rescue
  puts "Parse config.json error"

  exit
end

def get_access_token(app_id : Int32)
  puts "Open this page, and save token to config.json\n\n"

  token_url = "https://oauth.vk.com/authorize?client_id="\
  "#{app_id}&redirect_uri=vk.com&response_type=token"\
  "&display=mobile&v=5.131&revoke=1&state=01010&scope=offline"

  puts token_url
end

if json["accessToken"] == nil
  get_access_token(json["appID"].as_i)
else
  response = Crest.get(
    "https://api.vk.com/method/account.setOnline",
    params: { :voip => "0", :v => "5.131",
      :access_token => json["accessToken"].as_s,
      :user_ids => json["userIds"].as_i }
  )

  status = JSON.parse(response.body)

  begin # Missing hash key
    if status["error"]
      puts status["error"]["error_msg"]
      puts "Error code #{status["error"]["error_code"]}"

      puts "---"

      get_access_token(json["appID"].as_i)
    end
    rescue
      # execute if an exception is raised
  end

  begin # Status set
    if status["response"] == 1
      puts "Complete!"
    end
  rescue
    # execute if an exception is raised
  end
end
