# influxdb plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-influxdb)
[![Build Status](https://travis-ci.org/giginet/fastlane-plugin-influxdb.svg?branch=master)](https://travis-ci.org/giginet/fastlane-plugin-influxdb)

## Description

Post values to InfluxDB from your lane.

```ruby
lane :your_lane do
    influxdb(
        db_name: "sample_db",
        host: "fastlane.influxdb.com",
        port: 1234,
        username: "sample",
        password: "password",
        table_name: "metrics",
        tags: {tag1: "foo", tag2: "bar"},
        values: {a: 100, b: 200, c: 300}
    )
end
```

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-influxdb`, add it to your project by running:

```bash
fastlane add_plugin influxdb
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About `fastlane`

`fastlane` is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
