

Pod::Spec.new do |s|

  s.name         = "ReactiveCocoaPlay"
  s.version      = "0.0.1"
  s.summary      = "A short description of ReactiveCocoaPlay. test for pod spec."

  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/ZZWonder/ReactiveCocoaPlay"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  #s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "vint" => "vintrs@163.com" }
  # Or just: s.author    = "vint"
  # s.authors            = { "vint" => "vintrs@163.com" }
  # s.social_media_url   = "http://twitter.com/vint"

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"



  s.source       = { :git => "http://github.com/ZZWonder/ReactiveCocoaPlay.git", :tag => s.version }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

   s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
   s.dependency "ReactiveCocoa", "~> 2.5"

end
