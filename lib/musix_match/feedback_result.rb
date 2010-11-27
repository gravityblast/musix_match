module MusixMatch
  class FeedbackResult
    attr_reader :status_code, :execute_time
    
    def initialize(response)
      parse_response(response)
    end      
  
  protected
    
    def parse_response(response)
      parse_response_header(response)
    end

    def parse_response_header(response)
      [:status_code, :execute_time].each do |key|
        instance_variable_set "@#{key}", response['message']['header'][key.to_s]
      end
    end  
  end
end