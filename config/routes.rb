ActionController::Routing::Routes.draw do |map|
  map.styledobject "styledobjects/*id.css", :controller => 'styledobjects', :action => "show"
end