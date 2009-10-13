module StyledObjects
  module Helpers
    module StylesheetLinkTag

      def self.included(base)
        base.send(:include, InstanceMethods)
      end
      
      module InstanceMethods
        def so_stylesheet_link_tag
          return "<link href=\"#{styledobject_path styled_objects_partial_css_paths.sort.collect {|path| URI.encode(path.gsub(/:|\.css/, ''))}.join(':')}?#{styled_objects_max_mtime}\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />"
        end
      end
      
    end
  end
end
        
