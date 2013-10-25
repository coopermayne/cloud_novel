class SentencesController < ApplicationController

  def index
    id = Story.all.first.sentences.last.id + 1
    @sentences = Sentence.where(id: id)
  end

  def create
    unless current_user
      flash[:notice] = "you can't post a sentence without logging in!"
      redirect_to "/next"
      return
    end

    s = Sentence.new
    sentence = params[:sentence][:text]
    s.text = sentence
    @story = Story.find(params[:story_id])
    s.story = @story
    s.user = current_user
    if s.save
      flash[:notice] = "Sentence added!"
    else
      flash[:notice] = "Error!"
    end
    redirect_to "/next" 
  end

  def destroy
  end

  def new
    @sentence = Sentence.new
    @story = Story.find(params[:story_id])
    @sentence.story = @story

    @context = Story.all[0...-1].map{|line| line.sentences.sort_by{|sentence| sentence.votes.inject(0) {|sum, vote| vote.vote==true ? sum + 1 : sum - 1}}.reverse.first }
    @context = @context[-3..-1] || @context[-2..-1] || @context = @context[-1] 
    @context = [@context] unless @context.class == Array
    @context = @context.map{|line| line.text}.join(" ").gsub("*", "</p><p>").html_safe 
    @context = @context[-200..-1] || @context
    @context = "..." + @context
  end
end
