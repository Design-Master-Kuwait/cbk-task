# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'

target 'CbkTask' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # https://firebase.google.com/docs/auth/ios/google-signin
  # Pod Firebase Gogole Signin for gooogle login meeting sync
  pod 'Firebase/Auth', '9.6.0'
  pod 'GoogleSignIn', '5.0.2'
  
  #pod for ProgressBar
  #https://github.com/SVProgressHUD/SVProgressHUD
  pod 'SVProgressHUD', '2.2.5'
  

  #  # Add the pods for any other Firebase products you want to use in your app
  #  # For example, to use Firebase Authentication and Cloud Firestore
  pod 'FirebaseFirestore', '9.6.0'
  pod 'Firebase/Storage','9.6.0'
  pod 'Firebase/Database','9.6.0'


  target 'CbkTaskTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CbkTaskUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"

      end
    end
  end
