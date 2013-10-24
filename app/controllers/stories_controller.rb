class StoriesController < ApplicationController

  def index
    #show the whole story (except last line)
    @story = Story.all[0...-1].map{|line| line.sentences.sort_by{|sentence| sentence.votes.inject(0) {|sum, vote| vote.vote==true ? sum + 1 : sum - 1}}.reverse.first }
  end

  def next
    @story_id = Story.last.id
    @nextline_options = Story.last.sentences.sort_by{|sentence| sentence.votes.inject(0) {|sum, vote| vote.vote==true ? sum + 1 : sum - 1}}.reverse
  end

  def create
    Story.create
    redirect_to "/"
  end
end
