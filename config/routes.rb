TestyApp::Application.routes.draw do

  get "sessions/new"

  root to: "stories#index" #show the story

  get "/next" => "stories#next" #show the active voting page for last line in the story
  #get "/login" => ""
  #get "/logout" => ""
  #get "/signup" => ""
  
  get "lines/:story_id/sentences" => "sentences#index" #all the options for a given line in the book (no form)
  get "lines/:story_id/sentences/new" => "sentences#new"
  delete "lines/:story_id/sentences/:id" =>  "sentences#destroy"
  post "lines/:story_id/sentences" =>  "sentences#create"

  post "sentences/:sentence_id/votes" => "votes#create" #needs to get a true or false for the vote column

end
#== Route Map
# Generated on 22 Oct 2013 16:45
#
# root GET    /                                        stories#index
# next GET    /next(.:format)                          stories#next
#      GET    /lines/:story_id/sentences(.:format)     sentences#index
#      GET    /lines/:story_id/sentences/new(.:format) sentences#new
#      DELETE /lines/:story_id/sentences/:id(.:format) sentences#destroy
#      POST   /lines/:story_id/sentences(.:format)     sentences#create
#      POST   /sentences/:sentence_id/votes(.:format)  votes#create
