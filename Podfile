# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'GoodHabits' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for GoodHabits

  target 'GoodHabitsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GoodHabitsUITests' do
    inherit! :search_paths
    # Pods for testing
  end

pod 'FMDB',:inhibit_warnings => true
pod 'Masonry',:inhibit_warnings => true

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
        end
    end
end

end
