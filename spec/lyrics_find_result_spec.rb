require 'spec_helper'

describe MusixMatch::LyricsFindResult do
  it 'should set status_code' do
    response = load_fixture('track.lyrics.get')
    result = MusixMatch::LyricsFindResult.new(response)
    result.status_code.should == 200
  end
  
  it 'should set execute_time' do
    response = load_fixture('track.lyrics.get')
    result = MusixMatch::LyricsFindResult.new(response)
    result.execute_time.should == 0.025208044052
  end
  
  it 'should initialize a new lyrics with the first lyrics of lyrics_list' do
    response = load_fixture('track.lyrics.get')
    MusixMatch::Models::Lyrics.should_receive(:new).with(response['message']['body']['lyrics'])
    MusixMatch::LyricsFindResult.new(response)
  end
end