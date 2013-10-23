class StoriesController < ApplicationController
  def index
    #show the whole story (except last line)
    @story = Story.all.first
  end

  def next
    @story_id = Story.last.id
    @nextline_options = Story.last.sentences
  end
end
