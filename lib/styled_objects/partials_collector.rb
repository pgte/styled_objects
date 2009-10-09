module StyledObjects
  class PartialsCollector
    
    def initialize(view_paths)
      @partials = {}
      @view_paths = view_paths
    end
    
    def partial_visited(partial)
      style_file = _find_style_file(partial)
      if style_file
        @partials[style_file] = true
      else
        nil
      end
    end
    
    
    def << (partial)
      partial_visited(partial)
    end
    
    def partials
      @partials.keys
    end
    
    private
    
    def _find_style_file(partial)
      style_file = "#{partial}.css"
      #RAILS_DEFAULT_LOGGER.debug("Looking for #{style_file}")
      @view_paths.each do |view_path|
        try_path = File.join view_path, style_file
        return style_file if File.file? try_path
      end   
      nil
    end
    
  end
end