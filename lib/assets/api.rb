module Zomato

    class API
        
        include HTTParty
        format :json
        base_uri 'https://developers.zomato.com/api/v2.1/'
        default_params :format => 'json'

        def initalize(entity_id, entity_type, collection_id)
            @options = { query: {entity_id: entity_id, entity_type: entity_type, collection_id: collection_id} }
        end

        def request_data
        	@response = self.class.get("/search", :headers => {"X-Zomato-API-Key" => "f5e327252d7eaeb8a135c2804646707d"}, @options)
        	json = JSON.parse(@response.body)
        	puts json['response.body']
        end
        
    end

end
