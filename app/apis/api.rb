module Zomato

  class Api
    
    include HTTParty
    format :json
    base_uri 'https://api.zomato.com/v1/'
    default_params :format => 'json'

    def restaurants
    	@response = HTTParty.get("https://api.zomato.com/v1/", :headers => {"X-Zomato-API-Key" => ""})
    	json = JSON.parse(@response.body)
    	puts json['response.body']
    end
    
  end
  
end