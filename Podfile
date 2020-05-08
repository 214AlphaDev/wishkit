platform :ios, '11.0'

target 'WishKit' do
  use_frameworks!
  pod 'Apollo', '0.10.0'
  pod 'RealmSwift', '~> 3.20.0'
  pod 'FlowKit', :git => 'git@github.com:214AlphaDev/flowkit.git', :branch => 'master'
end

target 'WishKitDemo' do
    use_frameworks!
    pod 'WishKit', :path => '.'
end

target 'WishKitTests' do
  use_frameworks!
  pod 'WishKit', :path => '.'
  pod 'Quick'
  pod 'Nimble'
end
