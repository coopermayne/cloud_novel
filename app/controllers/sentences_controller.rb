class SentencesController < ApplicationController
  def index
    id = Story.all.first.sentences.last.id + 1
    @sentences = Sentence.where(id: id)
  end

  def create
    binding.pry
    unless current_user
      flash[:notice] = "you can't post a sentence without logging in!"
      redirect_to "/next"
      return
    end

    s = Sentence.new
    sentence = params[:sentence][:text]
    unless sentence[-1] == "."
      sentence += "."
    end
    s.text = sentence
    @story = Story.find(params[:story_id])
    s.story = @story
    s.user = current_user
    s.save
    redirect_to "/next" 
  end

  def destroy
  end

  def new
    @sentence = Sentence.new
    @story = Story.find(params[:story_id])
    @sentence.story = @story
  end
end
