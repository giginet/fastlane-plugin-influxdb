require 'influxdb'

describe Fastlane::Actions::InfluxdbAction do
  describe '#run' do
    let(:table_name) { 'table_name' }
    let(:values) do
      {
        a: 1,
        b: 2
      }
    end
    let(:params) do
      {
        db_name: 'db_name',
        host: 'example.com',
        username: 'user',
        password: 'password',
        table_name: table_name,
        values: values
      }
    end

    context 'with valid parameter' do
      before do
        allow_any_instance_of(InfluxDB::Client).to receive(:write_point)
          .with(table_name, { values: values })
          .and_return(nil)
      end

      it 'Post to InfluxDB' do
        expect(Fastlane::UI).to receive(:success).with("Successfully posted values to '#{table_name}'")
        Fastlane::Actions::InfluxdbAction.run(params)
      end
    end

    context 'with invalid parameter' do
      let(:response) { { error: 'authorization failed' } }
      before do
        allow_any_instance_of(InfluxDB::Client).to receive(:write_point)
          .with(table_name, { values: values })
          .and_raise(JSON.generate(response))
      end

      it 'Raise user_error from response' do
        expect(Fastlane::UI).to receive(:user_error!).with("authorization failed")
        Fastlane::Actions::InfluxdbAction.run(params)
      end
    end
  end
end
