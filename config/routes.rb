ActionController::Routing::Routes.draw do |map|
  map.connect 'issues/:issue_id/cc_addresses/:action/:id', :controller => 'cc_addresses'
end
