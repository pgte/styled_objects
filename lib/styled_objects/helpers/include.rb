module StyledObjects
  module Helpers
    module Include

      def self.included(base)
        base.send(:include, InstanceMethods)
      end
      
      module InstanceMethods
        def so_include_partial(path)
          partials_collector << _so_pick_partial_template_path(path, true)
        end
        def so_include_template(path)
          partials_collector << _so_pick_partial_template_path(path, false)
        end
      end
      
    end
  end
end
        
