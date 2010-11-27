require 'spec_helper'

describe MusixMatch::FeedbackResult do
  it 'should set status_code' do
    response = load_fixture('track.lyrics.feedback.post')
    result = MusixMatch::FeedbackResult.new(response)
    result.status_code.should == 200
  end
  
  it 'should set execute_time' do
    response = load_fixture('track.lyrics.feedback.post')
    result = MusixMatch::FeedbackResult.new(response)
    result.execute_time.should == 0.137812137604
  end  
end