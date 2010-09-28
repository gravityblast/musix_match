require 'spec_helper'

describe MusixMatch::TrackFindResult do
  it 'should set status_code' do
    response = load_fixture('track.get')
    result = MusixMatch::TrackFindResult.new(response)
    result.status_code.should == 200
  end
  
  it 'should set execute_time' do
    response = load_fixture('track.get')
    result = MusixMatch::TrackFindResult.new(response)
    result.execute_time.should == 0.0110709667206
  end
  
  it 'should initialize a new track with the first track of track_list' do
    response = load_fixture('track.get')
    MusixMatch::Models::Track.should_receive(:new).with(response['message']['body']['track_list'].first['track'])
    MusixMatch::TrackFindResult.new(response)
  end
end