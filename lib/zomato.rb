module Zomato

    class API
        include HTTParty
        attr_accessor :response_data
        format :json
        base_uri 'https://developers.zomato.com/api/v2.1'
        default_params :format => 'json'

        def initialize
            @headers = { "user-key" => "f5e327252d7eaeb8a135c2804646707d" }
        end

        def request_data(entity_id, entity_type, collection_id)
            @options = {"entity_id" => entity_id, "entity_type" => entity_type, "collection_id" => collection_id}
        	@response_data = self.class.get("/search", :query => @options, :headers => @headers)
        	json = JSON.parse(@response_data.body)
        	json['response.body']
        end

        def location(query)
            @response_data = self.class.get("/locations", :query => { "query" => query }, :headers => @headers)
            json = JSON.parse(@response_data.body)
            json['response.body']
        end

        def search(query)
            @response_data = self.class.get("/search", :query => { "q" => query }, :headers => @headers)
            json = JSON.parse(@response_data.body)
            json['response.body']
        end

        def search_with_location(query, lat, lon)
            @response_data = self.class.get("/search", :query => { "q" => query, "lat" => lat, "lon" => lon }, :headers => @headers)
            json = JSON.parse(@response_data.body)
            json['response.body']
        end

    end

end
