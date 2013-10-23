class VotesController < ApplicationController

  def create
    v = Vote.new
    v.vote = params[:vote]
    v.user = current_user
    v.sentence = Sentence.find(params[:sentence_id])
    v.save
    redirect_to "/next"
  end
end
