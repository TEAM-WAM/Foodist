module Zomato

    class API

        attr_accessor :response

        include HTTParty
        format :json
        base_uri 'https://developers.zomato.com/api/v2.1'
        default_params :format => 'json'

        def initialize(entity_id, entity_type, collection_id)
            @headers = { "user-key" => "f5e327252d7eaeb8a135c2804646707d" }
            @options = {"entity_id" => entity_id, "entity_type" => entity_type, "collection_id" => collection_id}
        end

        def request_data
        	@response = self.class.get("/search", :query => @options, :headers => @headers)
        	json = JSON.parse(@response.body)
        	json['response.body']
        end


    end

end
