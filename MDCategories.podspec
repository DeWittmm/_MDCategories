#
# Be sure to run `pod lib lint MDCategories.podspec'
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MDCategories"
  s.version          = "0.1.0"
  # s.summary          = "A short description of MDCategories."
  # s.description      = <<-DESC           DESC
  s.homepage         = "https://github.com/dewittmm/MDCategories"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "DeWittmm" => "dewittmm@gmail.com" }
  s.source           = { :git => "https://github.com/DeWittmm/MDCategories.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mm_dewitt'

  s.platform     = :ios, '7.1'
  s.requires_arc = true

  s.source_files = 'MDCategories'
  s.public_header_files = 'MDCategories/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end