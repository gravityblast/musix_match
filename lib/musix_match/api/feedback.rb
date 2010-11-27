module MusixMatch  
  module API
    class Feedback < Base
      class InvalidFeedbackTypeException < Exception; end
      
      VALID_TYPES = %w(wrong_attribution bad_characters lines_too_long wrong_verses wrong_formatting)
      
      def post_feedback(track_id, lyrics_id, feedback)
        raise InvalidFeedbackTypeException.new("Invalid feedback type. Try one of the following: #{VALID_TYPES.join(", ")}") unless VALID_TYPES.include?(feedback.to_s)
        response = get('track.lyrics.feedback.post', {:track_id => track_id, :lyrics_id => lyrics_id, :feedback => feedback})
        FeedbackResult.new(response)
      end
      
      def self.post_feedback(track_id, lyrics_id, feedback)
        Feedback.new.post_feedback(track_id, lyrics_id, feedback)
      end
    end
  end
end