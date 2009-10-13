class StyledObjects::Generator
  
  def self.generate(view_paths, uri)
    content = uri.split(':').collect do |path|
      path.gsub!(/\.\.|\/\//, '')
      file_path = self._find_partial_stylesheet(view_paths, "#{path}.css")
      if file_path
        File.open(file_path) do |file|
          ".#{StyledObjects::ClassNameBuilder.build_class_name_from_partial_path(path)}{\n#{file.read}\n}\n"
        end
      end
    end.compact.join("\n")
    file_path = self._find_partial_stylesheet(view_paths, "/globals.css")
    if file_path
      File.open(file_path) do |file|
        content = "#{file.read}\n#{content}"
      end
    end
    
    ::Less::Engine.new(content).to_css
  end
  
  private
  
  def self._find_partial_stylesheet(paths, path)
    for view_path in paths 
      try_path = File.join view_path, path
      return try_path if File.file? try_path 
    end
    nil
    
  end
  
end