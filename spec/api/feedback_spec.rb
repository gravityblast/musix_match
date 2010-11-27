require 'spec_helper'

describe MusixMatch::API::Feedback do
  it "should raise an exception for bad feedback type" do
    lambda do
      MusixMatch::API::Feedback.post_feedback(1, 1, "invalid-feedback-type")
    end.should raise_error(MusixMatch::API::Feedback::InvalidFeedbackTypeException)
  end    
  
  it "should call get with track.lyrics.feedback.post" do
    track_id = 1
    lyrics_id = 1
    feedback_type = 'wrong_attribution'
    feedback = MusixMatch::API::Feedback.new
    feedback.should_receive(:get).with('track.lyrics.feedback.post', {:track_id => track_id, :lyrics_id => lyrics_id, :feedback => feedback_type}).and_return(load_fixture('track.lyrics.feedback.post'))
    feedback.post_feedback(track_id, lyrics_id, feedback_type)
  end
  
  it "should initialize a new Feedback object" do
    track_id = 1
    lyrics_id = 1
    feedback_type = 'wrong_attribution'
    feedback = mock(MusixMatch::API::Feedback)
    MusixMatch::API::Feedback.should_receive(:new).and_return(feedback)
    feedback.should_receive(:post_feedback).with(track_id, lyrics_id, feedback_type)
    MusixMatch::API::Feedback.post_feedback(track_id, lyrics_id, feedback_type)
  end
  
  it "should initialize a FeedbackResult" do
    track_id = 1
    lyrics_id = 1
    feedback_type = 'wrong_attribution'
    feedback = MusixMatch::API::Feedback.new
    feedback_response = load_fixture('track.lyrics.feedback.post')
    feedback.should_receive(:get).with('track.lyrics.feedback.post', {:track_id => track_id, :lyrics_id => lyrics_id, :feedback => feedback_type}).and_return(feedback_response)
    MusixMatch::FeedbackResult.should_receive(:new).with(feedback_response)
    feedback.post_feedback(track_id, lyrics_id, feedback_type)
  end
end