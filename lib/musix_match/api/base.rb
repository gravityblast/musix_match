module MusixMatch
  module API
    class AuthenticationFailedException < Exception; end
    class APILimitReachedException < Exception; end
    class APIKeyNotSpecifiedException < Exception; end
    
    class Base
      API_URL = 'http://api.musixmatch.com/ws/1.1'
    
      def self.api_key=(value)
        @@api_key = value        
      end
    
      def self.api_key
        class_variable_defined?("@@api_key") ? @@api_key : nil
      end
    
      def self.url_for(method, params={})
        params.delete('format')
        params.delete('apikey')
        params.merge!({ :apikey => api_key, :format => 'json' })
        url_params = params.collect{|k, v| "#{k}=#{v}"}.join('&')
        URI.escape("#{API_URL}/#{method}?#{url_params}")
      end

      def self.get(method, params={})
        raise APIKeyNotSpecifiedException.new('You must specify the API key. MusixMatch::API::Base.api_key = "YOUR_API_KEY"') if api_key.nil?
        response = HTTParty.get(url_for(method, params))
        parsed_response = case response.parsed_response
        when Hash
          response.parsed_response
        when String
          JSON.parse(response.parsed_response)
        end
        case  parsed_response['message']['header']['status_code']
          when 401 then raise AuthenticationFailedException.new('Authentication failed, probably because of a bad API key')
          when 402 then raise APILimitReachedException.new('A limit was reached, either you exceeded per hour requests limits or your balance is insufficient')
        end
        parsed_response
      end
    
      def api_key    
        self.class.api_key
      end        

      def get(method, params={})
        self.class.get(method, params)
      end
    end
  end
end