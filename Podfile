platform :ios, '12.0'

use_frameworks!
inhibit_all_warnings!

workspace 'WeatherApp.xcworkspace'
project 'WeatherApp.xcodeproj'

def codeFormat
  pod 'SwiftLint', '~> 0.42.0'
end

def network
  pod 'Moya', '~> 14.0.0'
  pod 'Kingfisher', '~> 6.1.1'
end

def develepementPods
  codeFormat
  network
end

target 'WeatherApp' do
  # Pods for WeatherApp
  develepementPods
end


target 'WeatherAppTests' do
  inherit! :search_paths
  # Pods for testing
end


target 'WeatherAppUITests' do
  # Pods for testing
end


