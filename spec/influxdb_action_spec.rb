describe Fastlane::Actions::InfluxdbAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The influxdb plugin is working!")

      Fastlane::Actions::InfluxdbAction.run(nil)
    end
  end
end
