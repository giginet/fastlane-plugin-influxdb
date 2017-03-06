module Fastlane
  module Helper
    class InfluxdbHelper
      # class methods that you define here become available in your action
      # as `Helper::InfluxdbHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the influxdb plugin helper!")
      end
    end
  end
end
