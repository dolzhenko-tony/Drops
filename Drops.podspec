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
  s.post_install do |library_representation|
    require 'rexml/document'

    library = library_representation.library
    proj_path = library.user_project_path
    proj = Xcodeproj::Project.new(proj_path)
    target = proj.targets.first # good guess for simple projects

    info_plists = target.build_configurations.inject([]) do |memo, item|
      memo << item.build_settings['INFOPLIST_FILE']
    end.uniq
    info_plists = info_plists.map { |plist| File.join(File.dirname(proj_path), plist) }

    resources = library.file_accessors.collect(&:resources).flatten
    fonts = resources.find_all { |file| File.extname(file) == '.otf' || File.extname(file) == '.ttf' }
    fonts = fonts.map { |f| File.basename(f) }

    info_plists.each do |plist|
      doc = REXML::Document.new(File.open(plist))
      main_dict = doc.elements["plist"].elements["dict"]
      app_fonts = main_dict.get_elements("key[text()='UIAppFonts']").first
      if app_fonts.nil?
        elem = REXML::Element.new 'key'
        elem.text = 'UIAppFonts'
        main_dict.add_element(elem)
        font_array = REXML::Element.new 'array'
        main_dict.add_element(font_array)
      else
        font_array = app_fonts.next_element
      end

      fonts.each do |font|
        if font_array.get_elements("string[text()='#{font}']").empty?
          font_elem = REXML::Element.new 'string'
          font_elem.text = font
          font_array.add_element(font_elem)
        end
      end

      doc.write(File.open(plist, 'wb'))
    end
  end

end
