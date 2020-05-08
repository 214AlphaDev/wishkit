Pod::Spec.new do |s|
  s.name          = "WishKit"
  s.version       = "0.0.1"
  s.summary       = "SDK that provides functionality related to wish list."
  s.license       = { }
  s.homepage      = "https://github.com/214alphadev/wishkit"
  s.author        = { "Andrii Selivanov" => "seland@214alpha.com" }
  s.platform      = :ios, "11.0"
  s.source        = { :git => "git@github.com:214alphadev/wishkit.git" }
  s.source_files  = "WishKit/**/*.swift"
  s.framework     = "UIKit"
  s.dependency 'Apollo', '0.10.0'
  s.dependency 'FlowKit', '0.0.2'
  s.dependency 'RealmSwift', '3.20.0'
end
