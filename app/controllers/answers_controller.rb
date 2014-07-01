class AnswersController < ApplicationController
  def create
    @question = Question.find params[:question_id]
    @question.answers.create(params[:answer])
    redirect_to question_path(@question)
  end
end