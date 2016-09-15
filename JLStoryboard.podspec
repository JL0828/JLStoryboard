Pod::Spec.new do |s|

  s.name         = 'JLStoryboard'
  s.version      = 'V0.0.3'
  s.summary      = 'Help you to manage the Storyboard!'
  #s.description  = 'JLStoryboard V0.0.1. Help you to manage the Storyboard!'
  s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }
  s.author       = { '冰糖丢了葫芦娃' => 'cilike@sina.cn' }
  s.homepage     = 'https://github.com/JL0828/JLStoryboard'
  s.ios.deployment_target = '7.0'
  s.source       = { :git => 'https://github.com/JL0828/JLStoryboard.git', :tag => s.version.to_s }

  s.source_files  = 'JLStoryboard/*.{h,m}'
  s.public_header_files = 'JLStoryboard/*.h'

  s.frameworks = 'Foundation', 'UIKit'

  s.requires_arc = true

end
