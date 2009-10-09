module StyledObjects
  module ActionView
    module Base      
        def self.included(base)
          base.send(:include, InstanceMethods)
        end
        
      module InstanceMethods
        
        def self.included(base)
          base.class_eval do
            alias_method_chain :render, :styled_object unless base.respond_to? :render_with_styled_object
          end
        end

        def render_with_styled_object(options = {}, local_assigns = {}, &block)
          
          #render_without_styled_object (options, local_assigns, &block)
#          RAILS_DEFAULT_LOGGER.debug("render_with_styled_object with file: #{options[:file].path_without_format_and_extension if options[:file]} and partial #{options[:partial]}")
#          RAILS_DEFAULT_LOGGER.debug caller
          @partials_collector ||= ::StyledObjects::PartialsCollector.new(view_paths) 
          decorated = template_format == :html && ((options[:file].path_without_format_and_extension unless options[:file].nil?) || options[:partial])
          #RAILS_DEFAULT_LOGGER.debug "decorated: #{decorated}"
          
          if decorated && @partials_collector << (partial_full_path = _so_pick_partial_template_path(decorated, options[:file].nil?)) 
            so_decorate partial_full_path do
              render_without_styled_object(options, local_assigns, &block)
            end
          else
            render_without_styled_object (options, local_assigns, &block)
          end
          
        end
        
        protected
        
        def styled_objects_partial_css_paths
          (@partials_collector.partials if @partials_collector) || [] 
        end
    
        
        private
        
        def _so_pick_partial_template_path(partial_path, is_partial = true)
          if partial_path.include?('/')
            path = File.join(File.dirname(partial_path), "#{'_' if is_partial}#{File.basename(partial_path)}")
          elsif controller
            path = "#{controller.class.controller_path}/#{'_' if is_partial}#{partial_path}"
          else
            path = "#{'_' if is_partial}#{partial_path}"
          end
        end
        
        def _translate_partial_path_into_class(partial_path)
          "so-#{partial_path.gsub(/-/, '--').gsub(/\//, '-').gsub(/_/, '')}"
        end
      
      end
      
    end
    
  end
end