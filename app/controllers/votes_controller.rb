class VotesController < ApplicationController

  def create
    @voteable = if params[:type] == "answer"
      Answer.find(params[:answer])
    elsif params[:type] == "question"
      Question.find(params[:question])
    end
    @voteable.votes.create(direction: params[:direction])
    redirect_to :back
  end
end