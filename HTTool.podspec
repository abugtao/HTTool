#
# Be sure to run `pod lib lint HTTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HTTool'
  s.version          = '0.14.0'
  s.summary          = 'my tool'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/abugtao'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abugtao@163.com' => 'zhanghaitao@baoyinxiaofei.com' }
  s.source           = { :git => 'https://github.com/abugtao/HTTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HTTool/Classes/**/*.{h,m}'


  s.subspec 'macro' do |macro|
      macro.source_files = 'HTTool/Classes/macro/**/*'
  end


  #这里创建组件中的文件夹
  s.subspec 'category' do |category|
      category.source_files = 'HTTool/Classes/category/**/*'
      #这行解决文件夹中的类对别的文件夹的类有依赖
      category.dependency 'HTTool/macro'
      
  end
  
  s.subspec 'test' do |test|
      test.source_files = 'HTTool/Classes/test/**/*'
  end
  
  
  
  
  # s.resource_bundles = {
  #   'HTTool' => ['HTTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
