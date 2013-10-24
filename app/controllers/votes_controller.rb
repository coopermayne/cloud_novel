class VotesController < ApplicationController

  def create
    v = Vote.new
    v.vote = params[:vote]
    v.user = current_user
    v.sentence = Sentence.find(params[:sentence_id])
    
    #OPTIMIZE: move this into the model fool

    #if Vote.where(user_id: current_user.id,sentence_id: params[:sentence_id]).count > 0
      #flash[:notice] = "You can't vote twice"
      #redirect_to "/next"
      #return
    #end

    unless v.save
      flash[:notice] = "You can't vote without logging in!"
      redirect_to "/next"
      return
    end

    #if the vote count is greater than 2
    # => create a new line in the story
    #   and append current

    #OPTIMIZE: move this to the model too fool
    if Sentence.find(params[:sentence_id]).votes.count > 2
      redirect_to '/stories/create'
    else
      redirect_to "/next"
    end
  end

end
