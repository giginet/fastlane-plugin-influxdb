require 'influxdb'

module Fastlane
  module Actions
    class InfluxdbAction < Action
      def self.run(params)
        client ||= InfluxDB::Client.new(
          params[:db_name],
          host: params[:host],
          port: params[:port],
          username: params[:username],
          password: params[:password]
        )

        begin
          client.write_point(params[:table_name], { values: params[:values] })
          UI.success("Successfully posted values to '#{params[:table_name]}'")
        rescue StandardError => e
          response = JSON.parse(e.to_s)
          UI.user_error!(response['error'])
        end
      end

      def self.description
        "Post values to IndluxDB"
      end

      def self.authors
        ["giginet"]
      end

      def self.return_value
        "nil or error message"
      end

      def self.details
        "Post values to InfluxDB"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :db_name,
                                  env_name: "INFLUXDB_DB_NAME",
                               description: "DB name of InfluxDB",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :host,
                                  env_name: "INFLUXDB_HOST",
                               description: "Host of InfluxDB",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :port,
                                  env_name: "INFLUXDB_PORT",
                               description: "Port of InfluxDB",
                                  optional: false,
                             default_value: 8086,
                                      type: Integer),
          FastlaneCore::ConfigItem.new(key: :username,
                                  env_name: "INFLUXDB_USERNAME",
                               description: "User name of InfluxDB",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :password,
                                  env_name: "INFLUXDB_PASSWORD",
                               description: "Password of InfluxDB",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :table_name,
                                  env_name: "INFLUXDB_TABLE_NAME",
                               description: "Table name of InfluxDB",
                                  optional: false,
                                  type: String),
          FastlaneCore::ConfigItem.new(key: :values,
                               description: "Values to post",
                                  optional: false,
                                      type: Hash)
        ]
      end

      def self.example_code
        [
          'influxdb(
            db_name: "sample_db",
            host: "fastlane.influxdb.com",
            port: 1234,
            username: "sample",
            password: "password",
            table_name: "metrics",
            values: {a: 100, b: 200, c: 300}
          )'
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
