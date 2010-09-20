module MusixMatch
  class TrackSearchResult    
    attr_reader :status_code, :execute_time, :available, :track_list
    
    def initialize(response)
      @track_list = []
      parse_response(response)
    end
  
    def each
      @track_list.each do |lyrics|
        yield lyrics
      end
    end
  
  protected
    
    def parse_response(response)
      parse_response_header(response)
      parse_response_body(response)
    end

    def parse_response_header(response)
      [:status_code, :execute_time, :available].each do |key|
        instance_variable_set "@#{key}", response['message']['header'][key.to_s]
      end
    end  
  
    def parse_response_body(response)
      response['message']['body']['track_list'].each do |obj|        
        @track_list << Models::Track.new(obj['track'])
      end
    end
  end
end