# What is RudderStack?

**Short answer:** 
RudderStack is an open-source Segment alternative written in Go, built for the enterprise. .

**Long answer:** 
RudderStack is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.

## Getting Started with App Center Integration of iOS SDK
[App Center](https://appcenter.ms/) is Microsoft's cross-platform build automation and management platform that lets you seamlessly manage your app's lifecycle. With App Center, you can easily manage and automate your builds, effectively test your apps in the cloud, and monitor their real-time usage with the help of crash data and analytics.

1. Add App Center as destination from Rudder Dashboard and add the app secret key.

2. Rudder-AppCenter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Rudder-AppCenter'
```

## Initialize ```RudderClient```
Put this code in your ```AppDelegate.m``` file under the method ```didFinishLaunchingWithOptions```
```
RSConfigBuilder *builder = [[RSConfigBuilder alloc] init];
[builder withDataPlaneUrl:<YOUR_DATA_PLANE_URL>];
[builder withFactory:[RudderAppCenterFactory instance]];
[RSClient getInstance:<YOUR_WRITE_KEY> config:[builder build]];
```

## Send Events
Follow the steps from [RudderStack iOS SDK](https://github.com/rudderlabs/rudder-sdk-ios)

## Contact Us
If you come across any issues while configuring or using RudderStack, please feel free to [contact us](https://rudderstack.com/contact/) or start a conversation on our [Slack](https://resources.rudderstack.com/join-rudderstack-slack) channel. We will be happy to help you.
