platform :ios, '15.0'

source 'https://cdn.cocoapods.org/'
source 'https://github.com/lvmh-clienteling/ios-pod-specs.git'

use_frameworks!

def default_pods
  # Pods for Kenzo Clienteling
  pod 'MaisonKit'
#  pod 'MaisonKit/MKSettings'
#  pod 'MaisonKit/Dashboard'
#  pod 'MaisonKit/Catalog'
#  pod 'MaisonKit/Authentication'
#  pod 'MaisonKit/GenericForm'
#  pod 'MaisonKit/ProductShare'
  
  pod 'MaisonKitAuth', "~> 0.4.0" # Authentication framework
  pod 'Firebase/Analytics' # We send analytics to firebase
  pod 'Firebase/Messaging' # We use push notification
  pod 'Firebase/RemoteConfig' # Backend for feature flags
  pod 'Firebase/Crashlytics' # We track the app crashes on firebase crashlytics
  pod 'Moya/Combine' # Auto-generating networking uses Moya
  pod 'LVMHMoyaPlugins' # LVMH plugins to make working with Moya a bit easier
end

target 'Kenzo DEV' do
    default_pods
end

target 'Kenzo UAT' do
     default_pods
end

target 'Kenzo PROD' do
    default_pods
end

# For xcode 14
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
      target.build_configurations.each do |config|
        config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end
  end
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      end
    end
  end
end
