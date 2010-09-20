module MusixMatch
  class LyricsSearchResult    
    attr_reader :status_code, :execute_time, :available, :lyrics_list
    
    def initialize(response)
      @lyrics_list = []
      parse_response(response)
    end
  
    def each
      @lyrics_list.each do |lyrics|
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
      response['message']['body']['lyrics_list'].each do |obj|
        @lyrics_list << Models::Lyrics.new(obj['lyrics'])
      end
    end
  end
end