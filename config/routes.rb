ActionController::Routing::Routes.draw do |map|
  #map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route

  #map.resources :events, :collection => {:comment => :post}
#  map.resources :talks, :collection => {:comment => :post}
#
  
#
#  map.resources :rooms

#  map.resources :events, :collection => {:comment => :post} do |event|
#    event.resources :talks, :collection => {:comment => :post},:except=>[:new,:create] do |talk|
#      talk.resources :speakers, :rooms, :except=>[:new,:create]
#    end
#  end
#  map.resources :speakers, :only=>[:new,:create]
#  map.resources :rooms, :only=>[:new,:create]
#  map.resources :talks, :only=>[:new,:create,:show]

  #Descomentar esto:
#    map.resources :events, :collection => {:comment => :post} do |event|
#    event.resources :talks, :collection => {:comment => :post}
#    end
#     map.resources :events, :collection => {:comment => :post} do |event|
#    event.resources :rooms
#    end
#     map.resources :events, :collection => {:comment => :post} do |event|
#    event.resources :speakers
#    end
#map.resources :rooms do |room|
#  room.resources :talks, :collection=>{:comment=>:post}
#end
#
#  map.resources :events do |event|
#  event.resources :talks, :collection=>{:comment=>:post}
#end
  map.resources :talks, :collection=>{:comment=>:post} do |talk|
    talk.resources :rooms
  end
  map.resources :rooms

  map.resources :speakers

  
map.resources :events, :collection => {:comment => :post}

  map.namespace "admin" do |admin|
  admin.resources :events, :collection => {:comment => :post}
  admin.resources :speakers
   admin.resources :rooms
   admin.resources :talks, :collection=>{:comment=>:post} do |talk|
    talk.resources :rooms
  end

end

  #map.resources :events, :collection => {:comment => :post}



  
#  map.resources :events, :collection => {:comment => :post} do |event|
#    event.resources :talks, :collection => {:comment => :post} do |talk|
#      talk.resources :rooms
#    end
#  end


  
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  
  map.public 'events',:controller => 'events', :action => 'index'
  map.admin 'admin', :controller=>'admin/events',:action=>'index'

#  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
 # map.login '/login', :controller => 'sessions', :action => 'new'
 # map.register '/register', :controller => 'users', :action => 'create'
 # map.signup '/signup', :controller => 'users', :action => 'new'
 map.resources :user_sessions
  map.resources :users
#  map.resource :session

  
map.root :controller=>'events',:action=>'index'
  #map.root :controller => 'home', :action => 'index'
  #default

end

