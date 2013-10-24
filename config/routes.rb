TestyApp::Application.routes.draw do

  match '/auth/:provider/callback' => 'authentications#create'
  get '/authentications' => 'authentications#index'
  get "/authentications/:id/delete" => 'authentications#destroy'

  get "/login" => "sessions#new"
  get "/logoff" => "sessions#destroy"
  get "/signup" => "users#new", :as => "signup"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  get "/auth/:provider/callback" => "authentications#create"
  
  root to: "stories#index" #show the story
  get "/next" => "stories#next" #show the active voting page for last line in the story
  get "/stories/create" => "stories#create"

  get "lines/:story_id/sentences" => "sentences#index" #all the options for a given line in the book (no form)
  get "lines/:story_id/sentences/new" => "sentences#new"
  delete "lines/:story_id/sentences/:id" =>  "sentences#destroy"
  post "lines/:story_id/sentences" =>  "sentences#create"

  post "sentences/:sentence_id/votes" => "votes#create" #needs to get a true or false for the vote column

end
#== Route Map
# Generated on 24 Oct 2013 12:52
#
#    authentications GET    /authentications(.:format)               authentications#index
#                    GET    /authentications/:id/delete(.:format)    authentications#destroy
#      regular_users POST   /regular_users(.:format)                 regular_users#create
#  new_regular_users GET    /regular_users/new(.:format)             regular_users#new
# edit_regular_users GET    /regular_users/edit(.:format)            regular_users#edit
#                    GET    /regular_users(.:format)                 regular_users#show
#                    PUT    /regular_users(.:format)                 regular_users#update
#                    DELETE /regular_users(.:format)                 regular_users#destroy
#              login GET    /login(.:format)                         sessions#new
#             logoff GET    /logoff(.:format)                        sessions#destroy
#             signup GET    /signup(.:format)                        users#new
#              users POST   /users(.:format)                         users#create
#           sessions POST   /sessions(.:format)                      sessions#create
#                    GET    /auth/:provider/callback(.:format)       sessions#create_outside
#               root        /                                        stories#index
#               next GET    /next(.:format)                          stories#next
#     stories_create GET    /stories/create(.:format)                stories#create
#                    GET    /lines/:story_id/sentences(.:format)     sentences#index
#                    GET    /lines/:story_id/sentences/new(.:format) sentences#new
#                    DELETE /lines/:story_id/sentences/:id(.:format) sentences#destroy
#                    POST   /lines/:story_id/sentences(.:format)     sentences#create
#                    POST   /sentences/:sentence_id/votes(.:format)  votes#create
