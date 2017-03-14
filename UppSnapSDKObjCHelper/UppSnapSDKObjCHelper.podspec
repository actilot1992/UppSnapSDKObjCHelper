Pod::Spec.new do |s|
  s.name    = 'UppSnapSDKObjCHelper'
  s.version = '0.0.1'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'Objc Helper for UppSnapSDK'
  s.homepage = 'https://github.com/actilot1992/UppSnapSDKObjCHelper'
  s.authors = {
    'acilot' => 'actilot@gmail.com',
  }

  s.source = {
    :git => 'https://github.com/actilot1992/UppSnapSDKObjCHelper.git',
    :tag => "#{s.version}"
  }
  s.platform = :ios, '9.0'
  s.requires_arc = true
  s.frameworks = 'UIKit'

  s.source_files = 'UppSnapSDKObjCHelper/UppSnapSDKObjCHelper/**/*.{h,m}'

  s.dependency 'Mantle', '~> 2.1'

end
