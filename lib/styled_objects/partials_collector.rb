module StyledObjects
  class PartialsCollector
    
    def initialize(view_paths)
      @stylesheets = {}
      @visited_partials = {}
      @view_paths = view_paths
      @max_mtime = 0
    end
    
    def << (partial)
      unless @visited_partials[partial]
        @visited_partials[partial] = true
        style_file, mtime = _find_style_file(partial)
        if style_file
          @stylesheets[style_file] = true
          @max_mtime = mtime if mtime > @max_mtime  
        else
          nil
        end
      end
    end
    
    
    def stylesheets
      @stylesheets.keys
    end
    
    def max_mtime
      @max_mtime
    end
    
    private
    
    def _find_style_file(partial)
      style_file = "#{partial}.css"
      #RAILS_DEFAULT_LOGGER.debug("Looking for #{style_file}")
      @view_paths.each do |view_path|
        try_path = File.join view_path, style_file
        return [style_file, File.mtime(try_path).to_i] if File.file? try_path
      end
      #raise "SO: did not find style file for #{partial}"
      nil
    end
    
  end
end