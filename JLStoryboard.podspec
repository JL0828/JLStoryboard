Pod::Spec.new do |s|
  s.name             = "JLStoryboard"
  s.version          = "0.0.5"
  s.summary          = "Help you to manage the Storyboard!"
  s.description      = <<-DESC
                       JLStoryboard V0.0.5. Help you to manage the Storyboard!
                       DESC
  s.homepage         = "https://github.com/JL0828/JLStoryboard"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "冰糖丢了葫芦娃" => "cilike@sina.cn" }
  s.source           = { :git => "https://github.com/JL0828/JLStoryboard.git", :tag => "V0.0.5" }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '6.0'
  # s.ios.deployment_target = '6.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'JLStoryboard/*'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'UIKit'

end
