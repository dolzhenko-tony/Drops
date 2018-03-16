Pod::Spec.new do |s|
  s.name             = 'Drops'
  s.version          = '0.1.1'
  s.summary          = 'Photo Editor supports drawing, writing text, filters and adding stickers and emojis'
 
  s.description      = <<-DESC
Photo Editor supports drawing, writing text and adding stickers and emojis
with the ability to scale and rotate objects
                       DESC
 
  s.homepage         = 'https://github.com/dolzhenko-tony/Drops'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Anton Dolzhenko' => 'dolzhenko.tony@gmail.com' }
  s.source           = { :git => 'https://github.com/dolzhenko-tony/Drops.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'
  s.source_files = "Photo Editor/Photo Editor/**/*.{swift}"
  s.exclude_files = "Photo Editor/Photo Editor/**/AppDelegate.swift"
  s.resources = "Photo Editor/Photo Editor/**/*.{png,jpeg,jpg,storyboard,xib,ttf}"
  s.resource_bundles = { 'Drops' => ["Photo Editor/Photo Editor/**/*.ttf"] }
end
