require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name             = 'Rudder-AppCenter'
  s.version          = package['version']
  s.summary          = 'Privacy and Security focused Segment-alternative. AppCenter Native SDK integration support.'

  s.description      = <<-DESC
Rudder is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.
                       DESC

  s.homepage         = 'https://github.com/rudderlabs/rudder-integration-appcenter-ios'
  s.license          = { :type => "MIT", :file => "LICENSE.md" }
  s.author           = { 'RudderStack' => 'ruchira@rudderstack.com' }
  s.source           = { :git => 'https://github.com/rudderlabs/rudder-integration-appcenter-ios.git', :tag => "v#{s.version}" }
  s.platform         = :ios, "15.0"

  s.source_files = 'Rudder-AppCenter/Classes/**/*'

  s.static_framework = true

  s.dependency 'Rudder', '~> 1.0'
  s.dependency 'AppCenter'
end
