ActionController::Routing::Routes.draw do |map|
  map.resources :seasons, :has_many => [:episodes, :clips]

  map.resources :episodes, :has_many => [:clips]

  map.resources :playlist_clips

  map.resources :playlists

  map.resources :clips
  
   map.admin '/admin', :controller => 'admin', :action => 'index'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
