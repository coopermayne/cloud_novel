class VotesController < ApplicationController

  def create

    unless current_user
      flash[:notice] = "You can't vote without logging in sucker!"
      redirect_to "/next"
      return
    end

    v = Vote.new
    v.vote = params[:vote]
    v.user = current_user
    v.sentence = Sentence.find(params[:sentence_id])
    
    #OPTIMIZE: move this into the model fool


    if Vote.where(user_id: current_user.id,sentence_id: params[:sentence_id]).count > 0 && current_user.email != "coopermayne@gmail.com"
      flash[:notice] = "You can't vote twice"
      redirect_to "/next"
      return
    end

    unless v.save
      flash[:notice] = "Problem saving! voted didn't count"
      redirect_to "/next"
      return
    end

    #if the vote count is greater than 2
    # => create a new line in the story
    #   and append current
    #OPTIMIZE: move this to the model too fool
    if Sentence.find(params[:sentence_id]).votes.inject(0) {|sum, vote| vote.vote==true ? sum + 1 : sum - 1} > 2
      redirect_to '/stories/create'
    else
      redirect_to "/next"
    end
  end

end
