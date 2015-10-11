#
# Be sure to run `pod lib lint DCCoreDataManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DCCoreDataManager"
  s.version          = "1.0.0"
  s.summary          = "DCCoreDataManager is a Objective C, encapsulates all the Core Data Stack."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "A CoreData Manager to encapsule all the Core Data Stack on a Thread Safe mode"
  s.homepage         = "https://github.com/dcortes22/DCCoreDataManager"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "David Cortes" => "dcortes22@gmail.com" }
  s.source           = { :git => "https://github.com/dcortes22/DCCoreDataManager.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/dcortes22'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DCCoreDataManager' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
