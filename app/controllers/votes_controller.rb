class VotesController < ApplicationController

  def create
    v = Vote.new
    v.vote = params[:vote]
    v.user = current_user
    v.sentence = Sentence.find(params[:sentence_id])
    v.save
    if Sentence.find(params[:sentence_id]).votes.count > 3
      redirect_to '/stories/create'
    else
      redirect_to "/next"
    end
  end

end
