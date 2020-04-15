platform :ios, '11.0'

target 'WishKit' do
  use_frameworks!
  pod 'Apollo', '0.10.0'
  pod 'RealmSwift', '3.16.1'
  pod 'FlowKit', :git => 'git@gitlab.com:214alpha/utilities/flowkit.git', :commit => '5deb630fef942d4c3f02c7f653731bf5f667b2f8'
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
