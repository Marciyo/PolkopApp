source 'https://github.com/CocoaPods/Specs.git'

platform :ios, "10.3"

inhibit_all_warnings!
use_frameworks!

def import_common_pods
  pod 'Alamofire'
  pod 'AlamofireObjectMapper', '~> 4.0'
  pod 'ObjectMapper'
  pod 'SDWebImage'
  pod 'KVNProgress'
  pod 'MMDrawerController'
  pod 'KeychainAccess'
  pod 'IQKeyboardManager'
  pod 'Firebase'
  pod 'Firebase/Messaging'
  pod 'JVFloatLabeledTextField'
  pod 'ActiveLabel'
  pod 'GoogleMaps'
  pod 'GooglePlaces'
  pod 'SnapKit'
end

target 'PolkopApp' do
  import_common_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.2'
        end
    end
end
