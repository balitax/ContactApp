platform :ios, '10.3'

target 'ContactApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ContactApp

  pod 'RxSwift'
  pod 'Alamofire'
  pod 'IQKeyboardManagerSwift'
  pod 'RealmSwift'

  target 'ContactAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ContactAppUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.1'
    end
  end
end
