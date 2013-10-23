class SentencesController < ApplicationController
  def index
    id = Story.all.first.sentences.last.id + 1
    @sentences = Sentence.where(id: id)
  end

  def create
    s = Sentence.new
    s.text = params[:sentence][:text]
    @story = Story.find(params[:story_id])
    s.story = @story
    s.user = current_user
    s.save
    redirect_to "/" 
  end

  def destroy
  end

  def new
    @sentence = Sentence.new
    @story = Story.find(params[:story_id])
    @sentence.story = @story
  end
end
