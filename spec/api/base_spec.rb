require 'spec_helper'

describe MusixMatch::API::Base do
  it "should always use JSON as format" do    
    expected_url = MusixMatch::API::Base::API_URL + '/lyrics.get?apikey=&format=json'
    MusixMatch::API::Base.url_for('lyrics.get', :format => 'xml').should == expected_url
  end
  
  it "should use JSON as format even if the format key is a string" do    
    expected_url = MusixMatch::API::Base::API_URL + '/lyrics.get?apikey=&format=json'
    MusixMatch::API::Base.url_for('lyrics.get', 'format' => 'xml').should == expected_url
  end
  
  it "should raise an exception if api_key is not set" do
    lambda do
      MusixMatch::API::Base.get('http://localhost')
    end.should raise_error(MusixMatch::API::APIKeyNotSpecifiedException)
  end
  
  it "should call get on HTTParty" do
    MusixMatch::API::Base.api_key = 'API_KEY'
    method = 'lyrics.search'
    params = {:q_artist => 'artist name'}    
    url = MusixMatch::API::Base.url_for(method, params)
    response = mock(HTTParty::Response)
    parsed_response = {'message' => {'header' => {'status_code' => 200}}}
    response.should_receive(:parsed_response).twice.and_return(parsed_response)
    HTTParty.should_receive(:get).with(url).and_return(response)
    result = MusixMatch::API::Base.get(method, params)
    result.should == parsed_response
  end
  
  it "should raise an error" do
    lambda do
      MusixMatch::API::Base.api_key = 'API_KEY'
      method = 'lyrics.search'
      params = {:q_artist => 'artist name'}    
      url = MusixMatch::API::Base.url_for(method, params)
      response = mock(HTTParty::Response)
      parsed_response = {'message' => {'header' => {'status_code' => 401}}}
      response.should_receive(:parsed_response).twice.and_return(parsed_response)
      HTTParty.should_receive(:get).with(url).and_return(response)
      result = MusixMatch::API::Base.get(method, params)
      result.should == parsed_response
    end.should raise_error(MusixMatch::API::AuthenticationFailedException)
  end  
end