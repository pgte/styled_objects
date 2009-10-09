begin
  require 'less'
rescue LoadError => e
  e.message << " (You may need to install the less gem)"
  raise e
end

require  'styled_objects/partials_collector'
require  'styled_objects/generator'
require  'styled_objects/actionview'
require  'styled_objects/class_name_builder'
require  'styled_objects/html/decorator'
require  'styled_objects/helpers/stylesheet_link_tag'
ActionView::Base.class_eval {include StyledObjects::ActionView::Base}
ActionView::Base.class_eval {include StyledObjects::HTML::Decorator}
ActionView::Base.class_eval {include StyledObjects::Helpers::StylesheetLinkTag}