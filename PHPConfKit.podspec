Pod::Spec.new do |spec|
  spec.name = "PHPConfKit"
  spec.version = "0.1"
  spec.summary = "This is a SDK for bridge PHPConf Taiwan 2014's data API"
  spec.description = "" 
  spec.license = "MIT"
  spec.author = { "Vincent Chen" => "vince78718@gmail.com" }
  spec.ios.deployment_target = "7.1"
  spec.source = { :git => "http://www.github.com/vc7/PHPConfKit.git", :tag => "v#{spec.version}" }
	spec.source_files	= "PHPConfKit/*.{h,m,xcdatamodeld}"
  spec.requires_arc = true

	spec.framework    = 'CoreData'

  spec.dependency "AFNetworking", "~> 2.0"
  spec.dependency "MagicalRecord", "~> 2.0"
end
