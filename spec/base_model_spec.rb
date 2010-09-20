require 'spec_helper'

describe 'Base Model' do
  it "should always use JSON as format" do    
    expected_url = MusixMatch::API::Base::API_URL + '/lyrics.get?apikey=&format=json'
    MusixMatch::API::Base.url_for('lyrics.get', :format => 'xml').should == expected_url
  end
  
  it "should use JSON as format even if the format key is a string" do    
    expected_url = MusixMatch::API::Base::API_URL + '/lyrics.get?apikey=&format=json'
    MusixMatch::API::Base.url_for('lyrics.get', 'format' => 'xml').should == expected_url
  end
end