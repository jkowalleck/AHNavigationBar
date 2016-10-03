#
# Be sure to run `pod lib lint AHNavigationBar.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AHNavigationBar"
  s.version          = "0.2.0"
  s.summary          = "AHNavigationBar - a UINavigationBar with adjustable height"
  s.description      = <<-DESC
#AHNavigationBar - height adjustable UINavigationBar

allows setting the height via code

* `[myBar setHeight:23]`
* `myBar.height = 42`

or in the interface builder

                       DESC
  s.homepage         = "https://github.com/jkowalleck/AHNavigationBar"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jan Kowalleck" => "jan.kowalleck@gmail.com" }
  s.source           = { :git => "https://github.com/jkowalleck/AHNavigationBar.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AHNavigationBar' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
