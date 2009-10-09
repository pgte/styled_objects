module StyledObjects
  module HTML
    module Decorator
    
      def self.included(base)
        base.send(:include, InstanceMethods)
      end
      
      module InstanceMethods
        
        protected
        
        def so_decorate(partial_path, &block)
          "<div class=\"#{StyledObjects::ClassNameBuilder.build_class_name_from_partial_path(partial_path)}\">#{yield}</div>"
        end
        
        private
        
      end
        
    end
  end
end