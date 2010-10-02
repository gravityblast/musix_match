module MusixMatch  
  module API
    class TrackChart < Base
      def get_chart(options={})
        response = get('track.chart.get', options)
        TrackSearchResult.new(response)
      end
      
      def self.get_chart(options={})
        TrackChart.new.get_chart(options)
      end
    end
  end
end